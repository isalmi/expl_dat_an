library(lubridate)
library(dplyr)

## Read in data, all the lines we need are within the first 70,000
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", nrows = 70000, na.strings = "?")

## combine Date and Time and convert to a POSIXct format
data$Date <- dmy_hms(paste(data$Date, data$Time))
data <- select(data, Date, Global_active_power:Sub_metering_3)

## subset only data for Feb 1-2, 2007
data <- subset(data, data$Date>= ymd("2007-02-01") & data$Date < ymd("2007-02-03"))

## initialize panel of 4 plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

## draw panel 1
plot(data$Date, data$Global_active_power, type = 'l', ann = FALSE)
title(ylab = "Global Active Power (kilowatts)")

## draw panel 2
plot(data$Date, data$Voltage, type = "l", xlab = "Date and Time", ylab = "Voltage")

## draw panel 3
plot(data$Date, data$Sub_metering_1, type = "l", ann = FALSE)
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("top", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = "solid", box.lty=0)
title(ylab = "Energy sub metering")

## draw panel 4
plot(data$Date, data$Global_reactive_power, type = "l", xlab = "Date and Time", ylab = "Global Reactive Power")

dev.copy(png, file = "plot4.png")
dev.off()