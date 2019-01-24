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

## draw line graph, copy to working directory as a .png , and close device
plot(data$Date, data$Sub_metering_1, type = "l", ann = FALSE)
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = "solid")
title(ylab = "Energy sub metering")
dev.copy(png, file = "plot3.png")
dev.off()
