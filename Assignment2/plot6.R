library(dplyr)
library(ggplot2)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

sccFile <- "Source_Classification_Code.rds"
scc <- readRDS(sccFile)

cityData <- filter(data, fips %in% c("24510", "06037"))

allData <- merge(cityData, scc)

vehData <- allData[grep("Vehicles", allData$EI.Sector),]

ggplot(vehData, aes(fill = fips, x = as.factor(year), y=Emissions, col = fips)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(x = "Year", y = "Total Recorded Emissions (tons)", title = "Emissions from Motor Vehicles in Baltimore and Los Angelese") + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)) +
    scale_fill_discrete(name = "", labels = c("Los Angeles County", "Baltimore City")) +
    scale_color_discrete(name = "", labels = c("Los Angeles County", "Baltimore City"))


dev.copy(png, file = "plot6.png")
dev.off()