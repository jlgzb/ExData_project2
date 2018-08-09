# week 4
# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

NEI$year <- as.factor(NEI$year)

# extract the data of Baltimore City, Maryland(fips == "24510")
dat_24510 <- subset(NEI, NEI$fips == "24510")

# extract the motor vehicle source code from SCC 
source_motor <- SCC[grepl("Vehicle", SCC$SCC.Level.Two),]

# extract the motor vehicle data of Baltimore
dat_motor <- subset(dat_24510, dat_24510$SCC %in% source_motor$SCC)

# compute the total emissions for each year
emi_motor <- tapply(dat_motor$Emissions, dat_motor$year, sum)

# plot
png("plot5.png", width = 480, height = 480)

barplot(emi_motor,
        xlab = "year",
        ylab = "Total emissions (tons)",
        main = "Emissions change from motor vehicle sources changed \n from 1999-2008")

dev.off()
