# week 4
# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")

NEI$year <- as.factor(NEI$year)

emi_total <- tapply(NEI$Emissions, NEI$year, sum)

# plot
png("plot1.png", width = 480, height = 480)

barplot(emi_total,
        xlab = "year",
        ylab = "Total PM2.5 emision form all sources (tons)",
        main = "Total emisions from PM2.5 decreased \n in USA from 1999 to 2008")

dev.off()