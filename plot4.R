# week 4
# read the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

NEI$year <- as.factor(NEI$year)

# extract the useful source cource from SCC
source_coal <- SCC[grepl("Coal", SCC$Short.Name), ]

# extract the coal source data form NEI
dat_coal <- subset(NEI, NEI$SCC %in% source_coal$SCC)

# compute the total emissions according to the year
emi_coal <- summarise(group_by(dat_coal, year), sum(Emissions))

names(emi_coal) <- c("year", "total_emi")

# plot
png("plot4.png", width = 480, height = 480)

ggplot(emi_coal, aes(x = year, y = total_emi)) + geom_line(aes(group=1, col = total_emi)) + geom_point(aes(size=1, col = total_emi)) + labs(xlab = "year", ylab = "Total emissions (tons)") + ggtitle("Emissions change from coal combustion-related sources \n during 1999-2008")
                                                                                                                                             
dev.off()