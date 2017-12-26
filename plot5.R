#set the working directory where the source data ZIP file is extracted
setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Week 4 Assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
#filter Baltimore county data Motor related
baltimoresubset <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltaggregate <- aggregate(baltimoresubset[c("Emissions")], list(type = baltimoresubset$type, year = baltimoresubset$year, zip = baltimoresubset$fips), sum)
#baltaggregate1<- aggregate(baltimoresubset$Emissions, list(type = baltimoresubset$type, year = baltimoresubset$year, zip = baltimoresubset$fips), sum)

qplot(year, Emissions, data = baltaggregate, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore County") + xlab("Year") + ylab("Emission Levels")
## Saving to file 
dev.copy(png, file="plot5.png", height=480, width=480) 
dev.off() 