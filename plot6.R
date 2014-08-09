plot6<-function(){
    url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    dir.create("EPA")
    download.file(url,destfile="./EPA/data.zip",method="curl")
    NEI <- readRDS("./EPA/summarySCC_PM25.rds")
    SCC <- readRDS("./EPA/Source_Classification_Code.rds")
    
    baltimore<-subset(NEI,NEI$fips=="24510",)
    road<-subset(baltimore,baltimore$type=='ON-ROAD',)
    p<-ggplot(road,aes(x=factor(year),y=Emissions))+geom_bar(stat = "identity")
    baltimore<-p+labs(title = "Motor Cycle Emissions Baltimore city")+labs(x="Year")+labs(y=expression(PM[2.5]*" Emissions (tons) "))+theme_bw(base_family = "Helvetica", base_size =11)
    
    la<-subset(NEI,NEI$fips=="06037",)
    laroad<-subset(la,la$type=='ON-ROAD',)
    l<-ggplot(laroad,aes(x=factor(year),y=Emissions))+geom_bar(stat = "identity")
    la<-l+labs(title = "Motor Cycle Emissions LA county")+labs(x="Year")+labs(y=expression(PM[2.5]*" Emissions (tons) "))+theme_bw(base_family = "Helvetica", base_size =11)
    
    grid.arrange(la, baltimore, ncol=2)
    
    dev.copy(png,file="plot6.png")
    dev.off()
}