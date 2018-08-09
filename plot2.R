# week 4
# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")

NEI$year <- as.factor(NEI$year)

# extract the data of Baltimore city from NEI
dat_24510 <- subset(NEI, NEI$fips == "24510")

# compute the total emission for each year
emi_total <- tapply(dat_24510$Emissions, dat_24510$year, sum)

# plot
png("plot2.png", width = 480, height = 480)

barplot(emi_total,
        xlab = "year",
        ylab = "Total emisions from PM2.5 in the Maryland (tons)",
        main = "Total emisions from PM2.5 decreased \n in Maryland from 1999 to 2008")

dev.off()