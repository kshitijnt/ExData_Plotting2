setwd("~/Documents/Data Science/PollutantData_Project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIBaltimore <- NEI [NEI$fips =="24510",]
BaltimoreAgg <- aggregate(NEIBaltimore$Emissions ~ NEIBaltimore$year,FUN=sum)
colnames(BaltimoreAgg) <- c("Year", "Emissions")
png("plot5.png", height=480,width=480)
plot(BaltimoreAgg$Year,BaltimoreAgg$Emissions,type="l",ylab="Baltimore PM2.5 Emisisons",xlab="Year",col="blue" ,main="Baltimore PM2.5 Emissions")
dev.off()
