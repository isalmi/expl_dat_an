library(dplyr)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

tot_em <- data %>% group_by(year) %>% summarize_at(sum, .vars = "Emissions")

barplot(tot_em$Emissions, names.arg = tot_em$year, main = "Total Yearly Emissions", 
        xlab = "Year", ylab = "Total Recorded Emissions (tons)", col = "cyan")

dev.copy(png, file = "plot1.png")
dev.off()