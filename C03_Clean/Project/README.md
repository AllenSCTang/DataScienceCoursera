Readme File for run_analysis.R

Steps:
1. 
Extracted the files from the zipped raw data, and copied following files to my working directory:
activity_labels.txt
features.txt
subject_test.txt
subject_train.txt
X_test.txt
X_train.txt
y_test.txt
y_train.txt

2.
Read the above text files into R as data frames and gave names to these data frames according to the explanation files from original raw data and features.txt

3.
Merged test data into “test_tables” data frame, merged train data into “train_tables” data frame, and merged 2 data frames into “all_tables” data frame.
— Instruction 1 Completed -

4.
Extracted columns contain mean or std in names from “all_tables”, but removed the columns had meanFreq in names, which were not the target columns the instruction needed. 
Removed the the columns had “BodyBody” in names too, because of obvious typo error and there were duplicated columns with just one “Body” in names.
- Instruction 2 Completed - 

5.
Described the activities in the data frame got from step 4 by merging the data frame with activity_lables.txt
- Instruction 3 Completed -

6.
Change the original variable names in the data frame from step 5 to readers’ friendly version.
- Instruction 4 Completed - 

7.
Used “for” loops to separate the data frame from step 6 by one subject or one activity respectively, calculated the average of each variables for each subject and each activity.
Put the calculated results into rows and combined into a character vector.

8.
Changed the class of the vector to data frame, got the names from data frame generated in step 6, added “Average-“ to the beginning of names, and assigned the names to the data frame changed from the vector.

9.
Output the data frame as “DataSet.txt” by write.table() with row.name=F argument, and printed “The Data Set is generated as DataSet.txt”.
- Instruction 5 Completed - 
