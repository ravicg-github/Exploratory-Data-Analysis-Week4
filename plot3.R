#set the working directory where the source data ZIP file is extracted
setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Week 4 Assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)
subset1 <- subset(NEI, fips == "24510")
baltaggregateType <- aggregate(subset1[c("Emissions")], list(type = subset1$type, year = subset1$year), sum)
qplot(year, Emissions, data = baltaggregateType, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + xlab("Year") + ylab("PM2.5 Emissions") 
## Saving to file 
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 