library(ggplot2)

#Load Data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Select the SCC that corresponds to coal
vars<-grep("*coal*", SCC$Short.Name, ignore.case=T)
subsetscc<-SCC[vars,]
subsetscc<-subsetscc$SCC
NEI1<- NEI[NEI$SCC %in% subsetscc, ]

#Aggregate the data
NEI1<-aggregate(Emissions~year, NEI1, FUN=sum)

#Create the plot
png(file="plot4.png", width = 480, height = 480, units = "px")
ggplot(NEI1, aes(x=year, y=Emissions)) +geom_line() +labs(title="Total Coal Related Emissions For US", x="Year", y="Total Emissions")
dev.off()