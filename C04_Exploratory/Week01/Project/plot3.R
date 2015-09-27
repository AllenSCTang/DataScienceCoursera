plot3 <- function(...){
        table01<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)
        table01[,1]<-as.character(table01[,1])
        table01[,2]<-as.character(table01[,2])
        tf01<-grep(pattern="^1/2/2007",table01[,1])
        tf02<-grep(pattern="^2/2/2007",table01[,1])
        table02<-table01[c(tf01,tf02),]
        table02<-table02[complete.cases(table02),]
        time01<-paste(table02[,1],table02[,2],sep=" ")
        time01<-as.POSIXct(strptime(time01, format="%d/%m/%Y%H:%M:%S"))
        table02$FullDate<-time01
        
        ##Generate Plot 3
        Sys.setlocale("LC_TIME","C")
        png(filename="plot3.png",width=480,height=480)
        plot(y=table02[,7],x=table02[,10],type="l",ylab="Energy sub metering",xlab="")
        points(y=table02[,8],x=table02[,10],type="l",col="red")
        points(y=table02[,9],x=table02[,10],type="l",col="blue")
        legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
        dev.off()
        
        return("The plot 3 is generated successfully.")
}