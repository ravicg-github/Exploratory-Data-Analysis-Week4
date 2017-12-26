#set the working directory where the source data ZIP file is extracted
setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Week 4 Assignment")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
SCCsubsetcoal <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEIsubset <- NEI[NEI$SCC %in% SCCsubsetcoal$SCC, ]
plot4 <- ggplot(NEIsubset, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)
## Saving to file 
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 