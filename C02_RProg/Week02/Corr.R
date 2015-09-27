corr <- function(dir, th=0){
        setwd(dir)
        result<-numeric(0)
        dataset<-data.frame()
        Flist<-list.files()
        for(file in Flist){
                t_dataset<-read.csv(file)
                dataset<-rbind(dataset, t_dataset)
                rm(t_dataset)
        }
        c_dataset<-complete.cases(dataset)
        d_dataset<-subset(dataset,c_dataset)
        for(i in 1:332){
                sset<-subset(d_dataset,d_dataset$ID==i)
                if(nrow(sset)>th){
                        result<-c(result,cor(sset$sulfate,sset$nitrate))
                }
        }
        setwd("..")
        return(result)
}