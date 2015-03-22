setwd("~/Documents/Data Science/PollutantData_Project")
# Read Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data for  Baltimore
NEIBaltimore <- NEI [NEI$fips =="24510",]

# Merge with SCC
NEIBaltAgg <- aggregate(Emissions ~ year + type, NEIBaltimore, sum)

# Plot the Data
library(ggplot2)
png("plot3.png", height=480,width=480)
p <- ggplot(NEIBaltAgg, aes(x=year,y=Emissions,color=type)) 
     + ggtitle("Baltimore Emissions by Various Sources") + geom_smooth(method="loess")
print(p)

dev.off()

