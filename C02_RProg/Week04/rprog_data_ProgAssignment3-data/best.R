best <- function(state=character(1), outcome=character(1)){
        ## Read outcome data
        o_data<-read.csv("outcome-of-care-measures.csv")
        
        ## Check that state and outcome are valid
        o_state<-character()
        o_state<-as.character(o_data[,7])
        o_symptom<-character()
        o_symptom<-c("heart attack","heart failure","pneumonia")
        statematch<-charmatch(state,o_state)
        outcomematch<-charmatch(outcome,o_symptom)
        if(is.na(statematch)){
                stateNA<-paste("Error in best(",dQuote(state),",",dQuote(outcome),") : invalid state")
                suppressWarnings(stop("invalid state"))
        }
        if(is.na(outcomematch)){
                outcomeNA<-paste("Error in best(",dQuote(state),",",dQuote(outcome),") : invalid outcome")
                suppressWarnings(stop("invalid outcome"))
        }
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        statedata<-subset(o_data,o_data[,7]==state)
        if(outcome=="heart attack"){
                suppressWarnings(statedata[,11]<-as.numeric(as.character(statedata[,11])))
                symptondata<-statedata[order(statedata[,11],
                                             statedata[,2],
                                             decreasing=FALSE),]
        }
        if(outcome=="heart failure"){
                suppressWarnings(statedata[,17]<-as.numeric(as.character(statedata[,17])))
                symptondata<-statedata[order(statedata[,17],
                                             statedata[,2],
                                             decreasing=FALSE),]
        }
        if(outcome=="pneumonia"){
                suppressWarnings(statedata[,23]<-as.numeric(as.character(statedata[,23])))
                symptondata<-statedata[order(statedata[,23],
                                             statedata[,2],
                                             decreasing=FALSE),]
        }
        result<-as.character(symptondata[1,2])
        return(result)
        suppressWarnings()
}