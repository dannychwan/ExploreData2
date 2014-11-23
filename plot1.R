#Load Data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Aggregate the data
NEI1<-aggregate(Emissions~year,NEI, sum)

#Create the plot
png(file="plot1.png", width = 480, height = 480, units = "px")
barplot(as.integer(NEI1$Emissions), names.arg=NEI1$year, xlab="Years", ylab="Total Emissions", main="Total Emissions per year")
dev.off()