rankall <- function(outcome, num = "best") {
        ## Read outcome data
        o_data<-read.csv("outcome-of-care-measures.csv")
        
        ## Check that state and outcome are valid
        ## The state is not an input here, so no need to check state.
        o_symptom<-character()
        o_symptom<-c("heart attack","heart failure","pneumonia")
        outcomematch<-charmatch(outcome,o_symptom)
        if(is.na(outcomematch)){
                outcomeNA<-paste("Error in best(",dQuote(state),",",dQuote(outcome),",",dQuote(num),") : invalid outcome")
                stop("invalid outcome")
        }
        
        ## For each state, find the hospital of the given rank
        statelist<-as.character(unique(o_data[,7]))
        statelist<-sort(statelist)
        result<-data.frame()
        for(i in 1:length(statelist)){
                statedata=subset(o_data,o_data[,7]==statelist[i])
                if(outcome=="heart attack"){
                        suppressWarnings(statedata[,11]<-as.numeric(
                                as.character(statedata[,11])))
                        suppressWarnings(statedata[,7]<-as.character(statedata[,7]))
                        suppressWarnings(statedata[,2]<-as.character(statedata[,2]))
                        symptondata<-statedata[order(statedata[,11],
                                                     statedata[,2],
                                                     decreasing=FALSE),]
                sdata<-subset(symptondata,!is.na(symptondata[,11]))
                ranking<-as.numeric()
                if(num=="best"){
                        ranking<-c(1)
                }
                else if(num=="worst"){
                        ranking=nrow(sdata)
                }
                else{
                        ranking<-as.numeric(num)
                }
                temp1<-suppressWarnings(as.character(sdata[ranking,2]))
                if(is.na(temp1)){
                        temp1<-c("<NA>")
                }
                temp2<-suppressWarnings(as.character(statelist[i]))
                temp<-data.frame(hospital=temp1,state=temp2)
                row.names(temp)<-c(temp2)
                result<-rbind(result,temp)
                }
                
                if(outcome=="heart failure"){
                        suppressWarnings(statedata[,17]<-as.numeric(
                                as.character(statedata[,17])))
                        suppressWarnings(statedata[,7]<-as.character(statedata[,7]))
                        suppressWarnings(statedata[,2]<-as.character(statedata[,2]))
                        symptondata<-statedata[order(statedata[,17],
                                                     statedata[,2],
                                                     decreasing=FALSE),]
                        sdata<-subset(symptondata,!is.na(symptondata[,17]))
                        ranking<-as.numeric()
                        if(num=="best"){
                                ranking<-c(1)
                        }
                        else if(num=="worst"){
                                ranking=nrow(sdata)
                        }
                        else{
                                ranking<-as.numeric(num)
                        }
                        temp1<-suppressWarnings(as.character(sdata[ranking,2]))
                        if(is.na(temp1)){
                                temp1<-c("<NA>")
                        }
                        temp2<-suppressWarnings(as.character(statelist[i]))
                        temp<-data.frame(hospital=temp1,state=temp2)
                        row.names(temp)<-c(temp2)
                        result<-rbind(result,temp)
                }
                
                if(outcome=="pneumonia"){
                        suppressWarnings(statedata[,23]<-as.numeric(
                                as.character(statedata[,23])))
                        symptondata<-statedata[order(statedata[,23],
                                                     statedata[,2],
                                                     decreasing=FALSE),]
                        sdata<-subset(symptondata,!is.na(symptondata[,23]))
                        ranking<-as.numeric()
                        if(num=="best"){
                                ranking<-c(1)
                        }
                        else if(num=="worst"){
                                ranking=nrow(sdata)
                        }
                        else{
                                ranking<-as.numeric(num)
                        }
                        temp1<-suppressWarnings(as.character(sdata[ranking,2]))
                        if(is.na(temp1)){
                                temp1<-c("<NA>")
                        }
                        temp2<-suppressWarnings(as.character(statelist[i]))
                        temp<-data.frame(hospital=temp1,state=temp2)
                        row.names(temp)<-c(temp2)
                        result<-rbind(result,temp)
                }       
        }
      
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        colnames(result)<-c("hospital","state")
        return(result)
}