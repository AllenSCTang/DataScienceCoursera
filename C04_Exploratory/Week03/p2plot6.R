p2plot6 <- function(){
        library(ggplot2)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        BAL<-subset(NEI,NEI$fips==24510)
        LA<-subset(NEI,NEI$fips=="06037")
        twocities<-rbind(BAL,LA)

        ##I chose the "ON-ROAD" type of emission as motor vehicle in 2 city records.
        ##The reason was explained in the code of plot 5.
        twonei<-subset(twocities,twocities$type=="ON-ROAD")
        
        twonei$fips<-gsub("06037","Los Angeles County",twonei$fips)
        twonei$fips<-gsub("24510","Baltimore City",twonei$fips)
        
        png(filename="p2plot6.png",width=800,height=800)
        g<-ggplot(twonei,aes(year,Emissions))
        plot<-g+geom_point(size=4,alpha=1/2)+geom_smooth(method="lm")+facet_grid(.~fips)+
                labs(title="Trends of PM2.5 Emissions from Motor Vehicles in 2 Cities",x="Year",y="Emissions")+
                coord_cartesian(ylim=c(0,300))
        print(plot)
        dev.off()
        
        return("The plot 6 is generated successfully. According to the plot, the emission in LA was increasing and higher, while the one in Baltimore was decreasing and lower.")
}