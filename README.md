#README.MD
##Getting and Cleaning Data; Course Project; 
README.md in the repo describes how the script works 

## R-script: run_analysis.R
  This R-script is in the Main Github Repository directory. It will create the Tidy Data set from the working diretory, as long as the Samsung data is in the working directory.
 ## Raw Data
  Unzipping the data will place the data in a subdirectory labels "UCI HAR Dataset". All data files and more directry will be in the one subdirectory; ../UCI HAR Dataset/test/ and ../UCI HAR Dataset/test/ 

##Script steps
1. Merges the training and the test sets to create one data set.
   From ../UCI HAR Dataset/test/ add subject_test.txt, X_test.txt and y_test.txt
   From ../UCI HAR Dataset/train/ add subject_train.txt, X_train.txt and y_train.txt
   I did not add the Raw data from the from ../UCI HAR Dataset/test/Inertial Signals/ or ../UCI HAR Dataset/train/Inertial Signals/
   
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Labels the data set with descriptive variable names inplace of the V1, V2, V3... Get the new labels from the Feature.txt dataset.
5. Creates an independent tidy data set with the average of each variable for each activity and each subject.
6. Writes the tidy data set to a file with write.table; a text file that in easy to share.

##Tidy Data Set
1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. Make variable names human readable Test_Body_Accerlorator instead of V1
