pollutantmean <- function(dir, p, id=1:332){
        setwd(dir)
        firstsum<-0
        firstlength<-0
        finalmean<-0
        for(i in 1:length(id)){
                if(1<=id[i]&&id[i]<=9){
                        name<-c("00")
                        csvname<-paste(name,id[i],".csv",sep="")
                        dataset<-read.csv(csvname)
                        data<-subset(dataset,!is.na(dataset[p]),p,drop=T)
                        firstsum<-firstsum+sum(data)
                        firstlength<-firstlength+length(data)
                }
                else if(10<=id[i]&&id[i]<=99){
                        name<-c("0")
                        csvname<-paste(name,id[i],".csv",sep="")
                        dataset<-read.csv(csvname)
                        data<-subset(dataset,!is.na(dataset[p]),p,drop=T)
                        firstsum<-firstsum+sum(data)
                        firstlength<-firstlength+length(data)
                }
                else{
                        csvname<-paste(id[i],".csv",sep="")
                        dataset<-read.csv(csvname)
                        data<-subset(dataset,!is.na(dataset[p]),p,drop=T)
                        firstsum<-firstsum+sum(data)
                        firstlength<-firstlength+length(data)
                }
        }
        finalmean<-c(firstsum/firstlength)
        result<-as.numeric(finalmean)
        setwd("..")
        return(result)
}