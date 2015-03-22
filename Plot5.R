setwd("~/Documents/Data Science/PollutantData_Project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIBaltimore <- NEI [NEI$fips =="24510",]
BaltMotor <- NEIBaltimore[NEIBaltimore$type == "ON-ROAD",]
BaltMotorAgg <- aggregate(BaltMotor$Emissions ~ BaltMotor$year,FUN=sum)
colnames(BaltMotorAgg) <- c("Year", "Emissions")
png("plot5.png", height=480,width=480)
plot(BaltMotorAgg$Year,BaltMotorAgg$Emissions,type="l",ylab="PM2.5 Emisisons",xlab="Year",col="green" ,main="Baltimore City Motor Vehicle Emissions by Year")
dev.off()
