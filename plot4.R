library(ggplot2)
library(dplyr2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combustions <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coals <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustions & coals)
combustionSCC <- SCC[coalCombustion,]$SCC
aggr <- NEI[NEI$SCC %in% combustionSCC,]
aggr2 <- aggregate(Emissions ~ year + type, aggr, sum)

qplot(year, Emissions, data=aggr2, facets = .~type,main = "Emission from coal")
ggsave("plot4.png")
