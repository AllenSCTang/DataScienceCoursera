pollutantmean <- function(dir, p, id){
        setwd(dir)
        firstmean<-0
        finalmean<-0
        for(i in 1:length(id)){
                if(1<=id[i]&&id[i]<=9){
                        name<-c("00")
                        csvname<-paste(name,id[i],".csv",sep="")
                        data<-read.csv(csvname)
                        firstmean<-firstmean+colMeans(data[p],na.rm=TRUE)
                }
                else if(10<=id[i]&&id[i]<=99){
                        name<-c("0")
                        csvname<-paste(name,id[i],".csv",sep="")
                        data<-read.csv(csvname)
                        firstmean<-firstmean+colMeans(data[p],na.rm=TRUE)
                }
                else{
                        csvname<-paste(id[i],".csv",sep="")
                        data<-read.csv(csvname)
                        firstmean<-firstmean+colMeans(data[p],na.rm=TRUE)
                }
        }
        finalmean<-c(firstmean/length(id))
        result<-as.numeric(finalmean)
        setwd("..")
        return(result)
}