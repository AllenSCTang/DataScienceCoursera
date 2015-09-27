Plotsx4 <- function(...){
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
        
        ##Generate Plot 1
        png(filename="plot1.png",width=480,height=480)
        hist(table02[,3],main=paste("Global Acive Power"),xlab="Global Active Power (kilowatts)",col="red")
        dev.off()
        
        ##Generate Plot 2
        png(filename="plot2.png",width=480,height=480)
        plot(y=table02[,3],x=table02[,10],type="l",ylab="Global Active Power (kilowatts)",xlab="")
        dev.off()
        
        ##Generate Plot 3
        png(filename="plot3.png",width=480,height=480)
        plot(y=table02[,7],x=table02[,10],type="l",ylab="Energy sub metering",xlab="")
        points(y=table02[,8],x=table02[,10],type="l",col="red")
        points(y=table02[,9],x=table02[,10],type="l",col="blue")
        legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
        dev.off()
        
        ##Generate Plot 4
        png(filename="plot4.png",width=480,height=480)
        par(mfcol=c(2,2))
        plot(y=table02[,3],x=table02[,10],type="l",ylab="Global Active Power",xlab="")
        plot(y=table02[,7],x=table02[,10],type="l",ylab="Energy sub metering",xlab="")
        points(y=table02[,8],x=table02[,10],type="l",col="red")
        points(y=table02[,9],x=table02[,10],type="l",col="blue")
        legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
        plot(y=table02[,5],x=table02[,10],type="l",ylab="Voltage",xlab="datetime")
        plot(y=table02[,4],x=table02[,10],type="l",ylab="Global_reactive_power",xlab="datetime")
        dev.off()
        
        return("4 plots are generated successfully.")
}