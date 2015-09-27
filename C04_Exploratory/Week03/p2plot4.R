p2plot4 <- function(){
        library(ggplot2)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        ## Select items contain "Coal" in Short.Name in SCC
        coal<-grep("coal",SCC$Short.Name,ignore.case=T)
        coalscc<-SCC[coal,]
        suppressWarnings(coalnei<-subset(NEI,NEI$SCC==coalscc$SCC))
        
        png(filename="p2plot4.png",width=480,height=480)
        g<-ggplot(coalnei,aes(year,Emissions))
        plot<-g+geom_point(size=4,alpha=1/2)+geom_smooth(method="lm")+
                labs(title="Trends of PM2.5 Emissions from Coal Combustion",x="Year",y="Emissions")+
                coord_cartesian(ylim=c(0,500))
        print(plot)
        dev.off()
        
        return("The plot 4 is generated successfully. According to the plot, the emission from coal combustion was decreasing.")
}