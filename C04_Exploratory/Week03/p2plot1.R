p2plot1 <- function(){
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        set99<-subset(NEI$Emissions,NEI$year==1999)
        set02<-subset(NEI$Emissions,NEI$year==2002)
        set05<-subset(NEI$Emissions,NEI$year==2005)
        set08<-subset(NEI$Emissions,NEI$year==2008)
        
        data1<-data.frame()
        data1<-rbind("1999","2002","2005","2008")
        data1<-cbind(data1,sum(set99))
        data1[2,2]=sum(set02)
        data1[3,2]=sum(set05)
        data1[4,2]=sum(set08)
        
        png(filename="p2plot1.png",width=480,height=480)
        barplot(as.numeric(data1[,2]),main="Trend of Total PM2.5 Emissions",names.arg=c("1999","2002","2005","2008"),ylab="Total Emissions",xlab="Years")
        dev.off()
        
        return("The plot 1 is generated successfully, and the plot shows a trend of declining emissions.")
}