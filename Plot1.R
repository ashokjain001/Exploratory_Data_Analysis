plot1<-function(){
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
dir.create("EPA")
download.file(url,destfile="./EPA/data.zip",method="curl")
NEI <- readRDS("./EPA/summarySCC_PM25.rds")
SCC <- readRDS("./EPA/Source_Classification_Code.rds")
#by(NEI$Emissions,NEI$year,sum)
#plot(tapply(NEI$Emissions,NEI$year,sum),xaxt="n",ylab="Emissions(tons)",xlab="Years",pch=20)
#axis(1, at=1:length(xaxis), labels=xaxis)
#title(main="Total Emissions in tons over the years")
barplot(tapply(NEI$Emissions,NEI$year,sum),main="Total PM2.5 Emissions(tons) over the years",ylab="Emissions(tons)",xlab="Years",col="blue")
dev.copy(png,file="plot1.png")
dev.off()
}