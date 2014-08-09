plot2<-function(){
    url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    dir.create("EPA")
    download.file(url,destfile="./EPA/data.zip",method="curl")
    NEI <- readRDS("./EPA/summarySCC_PM25.rds")
    SCC <- readRDS("./EPA/Source_Classification_Code.rds")
    barplot(tapply(baltimore$Emissions,baltimore$year,sum),main="Baltimore Total PM2.5 Emissions(tons) over the years",ylab="Emissions(tons)",xlab="Years",col="red")
    dev.set(2)
    dev.copy(png,file="Plot2.png")
    dev.off()
}