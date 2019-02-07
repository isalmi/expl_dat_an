library(dplyr)
library(ggplot2)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

sccFile <- "Source_Classification_Code.rds"
scc <- readRDS(sccFile)

balt_dat <- filter(data, fips == "24510")

allData <- merge(balt_dat, scc)

vehData <- allData[grep("Vehicles", allData$EI.Sector),]
vehData$EI.Sector <- gsub("Mobile - On-Road ", "", vehData$EI.Sector)

ggplot(vehData, aes(fill = EI.Sector, x = as.factor(year), y=Emissions, col = EI.Sector)) +
    geom_bar(stat = "identity", position = "stack") +
    labs(x = "Year", y = "Total Recorded Emissions (tons)", title = "Yearly Emissions from Motor Vehicles") + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1), legend.title = element_blank())


dev.copy(png, file = "plot5.png")
dev.off()