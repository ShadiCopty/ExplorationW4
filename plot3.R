library(ggplot2)
library(dplyr2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- filter(NEI, fips == "24510")

Baltimore <- transform(Baltimore, year <- as.factor(year))
aggr <- aggregate(Emissions ~ year + type, Baltimore, sum)

qplot(year, Emissions, data=aggr, facets = .~type,main = "Baltimore emission over year by type")
ggsave("plot3.png")