setwd("~/Documents/Data Science/PollutantData_Project")
# Read Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data for NA & Baltimore
NEIBaltimore <- NEI [NEI$fips =="24510",]
NEILA <- NEI [NEI$fips =="06037",]

# Subset Data for each County/City by Motor Vehicle
BaltMotor <- NEIBaltimore[NEIBaltimore$type == "ON-ROAD",]
LAMotor <- NEILA[NEILA$type == "ON-ROAD",]
# Combine the Datasets
MotorCompare <- rbind(BaltMotor, LAMotor)

# Aggregate Data for each City County by Year
MotorAgg <- aggregate(Emissions ~ year + fips, MotorCompare, sum)

# Name the Cities
MotorAgg$city <- rep(NA,nrow(MotorAgg))
MotorAgg[MotorAgg$fips == "06037",][,"city"] <- "Los Angeles"
MotorAgg[MotorAgg$fips == "24510",][,"city"] <- "Baltimore"


# Plot the Data
png("plot6.png", height=480,width=480)
p <- ggplot(MotorAgg, aes(x=year, y=Emissions, colour=city)) +
  +     geom_smooth( method="loess") +
  +     ggtitle("Comparison of Vehicle Emissions - Baltimore/LA")
print(p)
dev.off()

