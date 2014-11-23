library(ggplot2)

#Load Data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Create subset of the ones belonging to Baltimore
NEI1<-subset(NEI, NEI$fips=="24510")

#Aggregate the data
NEI1<-aggregate(Emissions~year+type, NEI1, FUN=sum)

#Create the plot
png(file="plot3.png", width = 480, height = 480, units = "px")
ggplot(NEI1, aes(x=year, y=Emissions, group=type, color=type)) +geom_line() +labs(title="Total Emissions per Type per Year for Baltimore", x="Year", y="Total Emissions")
dev.off()