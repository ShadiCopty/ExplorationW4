library(ggplot2)
library(dplyr2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreVehcle <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
aggr <- aggregate(Emissions ~ year, data=BaltimoreVehcle, sum)

qplot(year, Emissions, data=aggr, main = "Baltimore vehicle emission over year by type")
ggsave("plot5.png")
