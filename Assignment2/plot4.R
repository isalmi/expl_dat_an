library(dplyr)
library(ggplot2)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

sccFile <- "Source_Classification_Code.rds"
scc <- readRDS(sccFile)

allData <- merge(data, scc)

coalData <- allData[grep("Coal", allData$EI.Sector),]

ggplot(balt_dat, aes(fill = EI.Sector, x = as.factor(year), y=Emissions, color = type)) + 
    geom_bar(stat = "identity", position = "stack", show.legend) + 
    labs(x = "Year", y = "Total Recorded Emissions (tons)", title = "Yearly Emissions from Coal Sources") + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))


dev.copy(png, file = "plot4.png")
dev.off()