#set the working directory where the source data ZIP file is extracted
setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Week 4 Assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)
#filter Baltimore county data Motor related
baltimoresubset <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltaggregate <- aggregate(baltimoresubset[c("Emissions")], list(type = baltimoresubset$type, year = baltimoresubset$year, zip = baltimoresubset$fips), sum)

#filter LA County data Motor related
subsetLAcounty <- subset(NEI, fips == "06037" & type=="ON-ROAD")
LAcountyagrregate <- aggregate(subsetLAcounty[c("Emissions")], list(type = subsetLAcounty$type, year = subsetLAcounty$year, zip = subsetLAcounty$fips), sum)

baltandLAdatabind <- rbind(baltaggregate, LAcountyagrregate)
qplot(year, Emissions, data = baltandLAdatabind, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")

## Saving to file 
dev.copy(png, file="plot6.png", height=480, width=480) 
dev.off() 