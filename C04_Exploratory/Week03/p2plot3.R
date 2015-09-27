p2plot3 <- function(){
        library(ggplot2)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        BAL<-subset(NEI,NEI$fips==24510)
        
        png(filename="p2plot3.png",width=800,height=800)
        g<-ggplot(BAL,aes(year,Emissions))
        plot<-g+geom_point(size=2,alpha=1/2)+facet_grid(.~type)+geom_smooth(method="lm")+
                labs(title="Trends of PM2.5 Emissions in Baltimore City",x="Year",y="PM2.5 Emissions")+
                coord_cartesian(ylim=c(0,300))
        print(plot)
        dev.off()
        
        return("The plot 3 is generated successfully. According to the plot, the emissions of 4 types were all decreasing.")
}