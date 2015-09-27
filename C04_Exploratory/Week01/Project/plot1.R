plot1 <- function(...){
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
        
        return("The plot 1 is generated successfully.")
}