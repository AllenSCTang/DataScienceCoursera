run_analysis <- function (...){
        ##I moved the needed text files from zip file to working directory before running this script
        y_test<-read.table("y_test.txt")
        y_train<-read.table("y_train.txt")
        x_test<-read.table("X_test.txt")
        x_train<-read.table("X_train.txt")
        s_test<-read.table("subject_test.txt")
        s_train<-read.table("subject_train.txt")
        a_label<-read.table("activity_labels.txt")
        features<-read.table("features.txt")
        
        ##Giving names to tables before merging
        names(y_test)<-c("Act_Label")
        names(s_test)<-c("Subject")
        names(x_test)<-features[,2]
        names(y_train)<-c("Act_Label")
        names(s_train)<-c("Subject")
        names(x_train)<-features[,2]
        names(a_label)<-c("Act_Label","Activity")
        
        ##Merging tables into one data set
        test_tables<-cbind(s_test,y_test,x_test)
        train_tables<-cbind(s_train,y_train,x_train)
        all_tables<-rbind(train_tables,test_tables)
        
        ##Extract columns contain mean() or std() from all_tables and remove duplicated BodyBody columns
        meanstd<-grepl(pattern=("(mean|std)"),features$V2)
        meanstd<-c(T,T,meanstd)
        msdata<-all_tables[meanstd]
        meanfreq<-grepl(pattern=("meanFreq"),names(msdata))
        msdata<-msdata[!meanfreq]
        bodyx2<-grepl(pattern=("BodyBody"),names(msdata))
        msdata<-msdata[!bodyx2]
        
        ##Name activities
        merge_act<-merge(a_label,msdata,by.x="Act_Label",by.y="Act_Label")
        ##merge_act$Act_Label<-NULL
        merge_act<-subset(merge_act,select=c(3,2,1,4:63))
        
        ##Name variables
        names(merge_act)<-sub("^t","TimeDomainOf",names(merge_act))
        names(merge_act)<-sub("^f","FreqDomainOf",names(merge_act))
        names(merge_act)<-sub("BodyAccJerkMag","AccelJerkMagnitudeBody",names(merge_act))
        names(merge_act)<-sub("BodyAccJerk","AccelJerkSignalBody",names(merge_act))
        names(merge_act)<-sub("BodyAccMag","AccelerationMagnitudeBody",names(merge_act))
        names(merge_act)<-sub("BodyAcc","AccelerationSignalBody",names(merge_act))
        names(merge_act)<-sub("BodyGyroJerkMag","GyroJerkMagnitudeBody",names(merge_act))
        names(merge_act)<-sub("BodyGyroJerk","GyroJerkSignalBody",names(merge_act))
        names(merge_act)<-sub("BodyGyroMag","GyroscopeMagnitudeBody",names(merge_act))
        names(merge_act)<-sub("BodyGyro","GyroscopeSignalBody",names(merge_act))
        names(merge_act)<-sub("GravityAccMag","AccelerationMagnitudeGravity",names(merge_act))
        names(merge_act)<-sub("GravityAcc","AccelerationSignalGravity",names(merge_act))
        names(merge_act)<-sub("mean\\(\\)","AverageNumber",names(merge_act))
        names(merge_act)<-sub("std\\(\\)","StandardDeviation",names(merge_act))
        
        ##Create 2nd data set
        final_row<-c()
        merge_act[,2]<-as.character(merge_act[,2])
        for(i in 1:30){
                smerge_i<-subset(merge_act,merge_act[,1]==i)
                subrow<-c(i,"AllActivity")
                for(j in 4:63){
                        subrow<-c(subrow,mean(smerge_i[,j]))
                }
                final_row<-rbind(final_row,subrow)
        }
        for(m in 1:6){
                amerge_m<-subset(merge_act,merge_act[,3]==m)
                actrow<-c("AllSubject",amerge_m[1,2])
                for(n in 4:63){
                        actrow<-c(actrow,mean(amerge_m[,n]))
                }
                final_row<-rbind(final_row,actrow)
        }
        
        ##Finalize the data set and output as a text file
        final<-as.data.frame(final_row)
        final_names<-names(merge_act)
        final_names<-final_names[-3]
        final_names<-sub("^T","Average-T",final_names)
        final_names<-sub("^F","Average-F",final_names)
        names(final)<-final_names
        write.table(final,"DataSet.txt",row.names=F)
        return("The Data Set is generated as DataSet.txt")
}