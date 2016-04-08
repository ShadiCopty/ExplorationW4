library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
syr <- split(NEI$Emissions, NEI$year)
z <- sapply(syr, sum)

png('plot1.png')
plot(names(z), z, main="emission over years", ylab="Emission")
dev.off()
