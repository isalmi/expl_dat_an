library(dplyr)
library(ggplot2)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

sccFile <- "Source_Classification_Code.rds"
scc <- readRDS(sccFile)

allData <- merge(data, scc)

dev.copy(png, file = "plot1.png")
dev.off()