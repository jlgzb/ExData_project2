# week 4
# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")

NEI$year <- as.factor(NEI$year)

# extract data of Baltimore City (fips == "24510") from NEI
dat_24510 <- subset(NEI, NEI$fips == "24510")

library(ggplot2)

# plot
png("plot3.png", width = 480, height = 480)

ggplot(dat_24510, aes(x = year, y = log(Emissions))) + geom_boxplot(aes(fill = type)) + facet_grid(.~type) + ggtitle("Emisssions change of the four types of sources \n from 1999-2008 for Baltimore City")

dev.off()