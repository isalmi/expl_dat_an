library(dplyr)
library(ggplot2)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

sccFile <- "Source_Classification_Code.rds"
scc <- readRDS(sccFile)

allData <- merge(data, scc)

ggplot(balt_dat, aes(fill = type, x = as.factor(year), y=Emissions, color = type))

dev.copy(png, file = "plot1.png")
dev.off()