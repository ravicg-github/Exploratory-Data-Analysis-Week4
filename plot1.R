#set the working directory where the source data ZIP file is extracted
setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Week 4 Assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
aggregateddata <- with(NEI, aggregate(Emissions, by = list(year), sum))
plot(aggregateddata, type="o", main = "Total PM2.5 Emissions", xlab ="Year", ylab = "PM2.5 Emissions", pch=19, col="green", lty=6)
## Saving to file 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 