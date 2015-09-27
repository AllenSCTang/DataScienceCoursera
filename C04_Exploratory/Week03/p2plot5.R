p2plot5 <- function(){
        library(ggplot2)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        BAL<-subset(NEI,NEI$fips==24510)
        
        ## Select items contain "veh" or "motor" in Short.Name in SCC
        ##motor00<-grep("[Vv]eh",SCC$Short.Name,ignore.case=T)
        ##motor01<-grep("[Mm]otor",SCC$Short.Name,ignore.case=T)
        ## Select items contain "veh" or "motor" in EI.Sector in SCC
        ##motor02<-grep("[Vv]eh",SCC$EI.Sector,ignore.case=T)
        ##motor01<-grep("On-Road",SCC$EI.Sector,ignore.case=T)
        ## Select items contain "veh" or "motor" in SCC.Level.Two in SCC
        ##motor03<-grep("veh|motor",SCC$SCC.Level.Two,ignore.case=T)
        ## Select items contain "veh" or "motor" in SCC.Level.Four in SCC
        ##motor04<-grep("veh|motor",SCC$SCC.Level.Four,ignore.case=T)
        ## Select items contain "veh" or "motor" in SCC.Level.Three in SCC
        ##motor05<-grep("veh|motor",SCC$SCC.Level.Three,ignore.case=T)        
        ##motor<-c(motor01,motor02,motor03,motor04,motor05)
        
        ##Select "Onroad" in Data.Category in SCC for motor vehicle sources
        ##motorscc<-subset(SCC,SCC$Data.Category=="Onroad")
        ##motorscc<-as.character(motorscc)
        
        ##motor<-c(motor02)
        ##motor<-unique(motor)
        ##motorscc<-SCC[motor,]
        ##suppressWarnings(motornei<-subset(BAL,BAL$SCC==motorscc$SCC))
        
        ##I tried above grep patterns to select possible motor vehicle SCCs in SCC,
        ##but matched nothing or less than 5 rows when crossed with Baltimore records.
        ##So I chose the "ON-ROAD" type of emission as motor vehicle in Baltimore records.
        motornei<-subset(BAL,BAL$type=="ON-ROAD")
        
        png(filename="p2plot5.png",width=480,height=480)
        g<-ggplot(motornei,aes(year,Emissions))
        plot<-g+geom_point(size=4,alpha=1/2)+geom_smooth(method="lm")+
                labs(title="Trends of PM2.5 Emissions from Motor Vehicles",x="Year",y="Emissions")+
                coord_cartesian(ylim=c(0,30))
        print(plot)
        dev.off()
        
        return("The plot 5 is generated successfully. According to the plot, the emission from motor vehicle was slightly decreasing.")
}