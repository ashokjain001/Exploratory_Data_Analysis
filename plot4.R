plot4<-function(){
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
grep("Coal",SCC$EI.Sector,ignore.case=TRUE)
code<-SCC$SCC[ grep("Coal",SCC$EI.Sector,ignore.case=TRUE)]
ndata<-subset(NEI,NEI$SCC %in% code,)
p<-ggplot(ndata, aes(x = factor(year), y = Emissions)) + geom_bar(stat = "identity",width = .5)
p+labs(title = "Emissions from coal combustion-related sources US")+labs(x="Year")+labs(y=expression(PM[2.5]*" Emissions (tons)"))+theme_bw(base_family = "Helvetica", base_size =11)
dev.copy(png,filename="plot4.png")
dev.off()
}

