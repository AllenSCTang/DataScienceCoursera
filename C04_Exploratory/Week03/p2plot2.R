p2plot2 <- function(){
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        BAL<-subset(NEI,NEI$fips==24510)
        
        set99<-subset(BAL$Emissions,BAL$year==1999)
        set02<-subset(BAL$Emissions,BAL$year==2002)
        set05<-subset(BAL$Emissions,BAL$year==2005)
        set08<-subset(BAL$Emissions,BAL$year==2008)
        
        data1<-data.frame()
        data1<-rbind("1999","2002","2005","2008")
        data1<-cbind(data1,sum(set99))
        data1[2,2]=sum(set02)
        data1[3,2]=sum(set05)
        data1[4,2]=sum(set08)
        
        png(filename="p2plot2.png",width=480,height=480)
        barplot(as.numeric(data1[,2]),main="Baltimore City PM2.5 Emissions",names.arg=c("1999","2002","2005","2008"),ylab="PM2.5 Emissions",xlab="Years")
        dev.off()
        
        return("The plot 2 is generated successfully, and the plot shows a trend of up-and-down emissions.")
}