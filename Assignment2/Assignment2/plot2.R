library(dplyr)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

tot_balt <- data %>% 
    filter(fips == "24510") %>% 
    group_by(year) %>% 
    summarize_at(sum, .vars = "Emissions")

barplot(tot_balt$Emissions, names.arg = tot_balt$year, 
        main = "Total Yearly Emissions in Baltimore City, MD", 
        xlab = "Year", ylab = "Total Recorded Emissions (tons)", 
        col = "violetred2")


dev.copy(png, file = "plot2.png")
dev.off()