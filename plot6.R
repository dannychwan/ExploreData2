library(ggplot2)

#Load Data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Select the SCC that corresponds to motor vehicles
vars<-grep("motor", SCC$Short.Name, ignore.case=T)
subsetscc<-SCC[vars,]
subsetscc<-subsetscc$SCC
NEI1<- NEI1[NEI1$SCC %in% subsetscc, ]

#Create subset of the ones belonging to Baltimore and LA
NEI1<-subset(NEI, NEI$fips=="24510"| NEI$fips=="06037")

#Aggregate the data
NEI1<-aggregate(Emissions~year+fips, NEI1, FUN=sum)

#Create the plot
png(file="plot6.png", width = 480, height = 480, units = "px")
ggplot(NEI1, aes(x=year, y=Emissions, group=fips, color=fips)) +geom_line() +labs(title="Comparison of Motor Vehicle Emissions - Baltimore City vs LA", x="Year", y="Total Emissions")
dev.off()