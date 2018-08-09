# week 4
# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

NEI$year <- as.factor(NEI$year)

# extract the data of Baltimore City (fips == "24510")
dat_24510 <- subset(NEI, NEI$fips == "24510")

# extract the data of Los Angeles (fips == "06037")
dat_06037 <- subset(NEI, NEI$fips == "06037")

# extract the motor vehicle source code from SCC 
source_motor <- SCC[grepl("Vehicle", SCC$SCC.Level.Two),]

# extract the motor vehicle data of Baltimore
dat_vehicle_24510 <- subset(dat_24510, dat_24510$SCC %in% source_motor$SCC)

# extract the motor vehicle data of Los Angeles
dat_vehicle_06370 <- subset(dat_06037, dat_06037$SCC %in% source_motor$SCC)

# compute the emissions change of Baltimore City during 1999-2008
emi_vehicle_24510 <- tapply(dat_vehicle_24510$Emissions, dat_vehicle_24510$year, sum)

# compute the emissions change of Los Angeles City during 1999-2008
emi_vehicle_06370 <- tapply(dat_vehicle_06370$Emissions, dat_vehicle_06370$year, sum)

png("plot6.png", width = 480, height = 480)

par(mfrow = c(1, 2), mar = c(5, 4, 1, 2), oma = c(0, 0, 3, 0))

barplot(emi_vehicle_24510,
     xlab = "Baltimore Trend",
     ylab = "Total emissions (tons)")

barplot(emi_vehicle_06370,
     xlab = "Los Angeles Trend",
     ylab = "Total emissions (tons)")

title("Emissions change from motor vehicle sources \n in Baltimore City and Los Angeles during 1999-2008", outer = TRUE)

dev.off()