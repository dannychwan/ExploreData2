#Load Data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Create subset of the ones belonging to Baltimore
NEI1<-subset(NEI, fips==24510)

#Aggregate the data
NEI1<-aggregate(Emissions~year,NEI1, sum)

#Create the plot
png(file="plot2.png", width = 480, height = 480, units = "px")
barplot(as.integer(NEI1$Emissions), names.arg=NEI1$year, xlab="Years", ylab="Total Emissions", main="Total Emissions per year for Baltimore")
dev.off()