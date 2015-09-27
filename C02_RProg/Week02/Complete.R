complete <- function(dir, id = 1:332) {
        setwd(dir)
        result<-data.frame()
        dataset<-data.frame()
        Flist<-list.files()
        for(file in Flist){
                t_dataset<-read.csv(file)
                dataset<-rbind(dataset, t_dataset)
                rm(t_dataset)
        }
        for(i in 1:length(id)){
                sset<-subset(dataset,dataset$ID==id[i])
                csset<-complete.cases(sset)
                dsset<-subset(sset,csset)
                result<-rbind(result, data.frame(id[i],nrow(dsset)))
        }
        colnames(result)<-c("id","nobs")
        setwd("..")
        return(result)
        }