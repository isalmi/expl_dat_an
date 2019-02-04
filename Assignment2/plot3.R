library(dplyr)
library(ggplot2)

file <- "summarySCC_PM25.rds"
data <-  readRDS(file)

balt_dat <- filter(data, fips == "24510")

ggplot(balt_dat, aes(fill = type, x = as.factor(year), y=Emissions, color = type)) + 
    geom_bar(stat = "identity", show.legend = FALSE) + 
    facet_wrap(~type, nrow = 1, ncol=4) + 
    labs(x = "Year", y = "Total Recorded Emissions (tons)", title = "Yearly Emissions by Type") + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

dev.copy(png, file = "plot3.png")
dev.off()