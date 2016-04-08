library(ggplot2)
library(dplyr2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreVehcle <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
aggr <- aggregate(Emissions ~ year, data=BaltimoreVehcle, sum)
aggr$City = "Baltimore"

LaVehcle <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
aggr2 <- aggregate(Emissions ~ year, data=LaVehcle, sum)
aggr2$City = "LA"

aggr3 <- rbind (aggr, aggr2)

qplot(year, Emissions, data=aggr3, color = City, main = "Vehicle emission over year by type")
ggsave("plot6.png")
