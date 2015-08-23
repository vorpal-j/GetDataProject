#This R-script can run as long as the Samsung data is in your working directory (per instructions)
# But I include the steps to download the data.
#Automate the download process of the zipped data file:
        #download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        #              destfile = "data/activity.zip", method = "curl", mode = "wb")
        #unzip(zipfile = "data/activity.zip")
        #list.files("UCI HAR Dataset",recursive = TRUE) 

# 1. Merges the training and the test sets to create one data set
# Merge the 3 test data set, first correcting the variable name for Activity and subject
X_test <-read.table("UCI HAR Dataset/test/X_test.txt")
y_test <-read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test)[1]<-"activity"
subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt") 
names(subject_test)[1]<-"subject"
meMerge1<-cbind(subject_test,y_test,X_test)

# Merge the 3 train data set, first correcting the variable name for Activity and subject
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train)[1]<-"activity"
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train)[1]<-"subject"
meMerge2<-cbind(subject_train,y_train,X_train)

#Merge the test and train dataset together to get one data set!
projMerge <-rbind(meMerge1,meMerge2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# find the Mean and Standard Deviation data; by looking at the feature data.
    fea <-read.table("UCI HAR Dataset/feature.txt")
# Find the Variable that contain mean or std Then subset to only those Columns
# Get a vector of the numbers of the needed columns
    # I must add 2 for the first 2 column:
    Feature_Mean_Std <-c(1,2,3,4,5,6,7,8)
# Subset the data set: projMerge
    projMerge8<- projMerge[,Feature_Mean_Std]

#3. Uses descriptive activity names to name the activities in the data set
    activity <-read.table("UCI HAR Dataset/activity_labels.txt")
    projMergeAct<-projMerge8
    for (i in seq_along(projMergeAct[,2])) {  
            if (projMergeAct[i,2]==1) {projMergeAct[i,2] <- "WALKING" }
            if (projMergeAct[i,2]==2) {projMergeAct[i,2] <- "WALKING_UPSTAIRS"}
            if (projMergeAct[i,2]==3) {projMergeAct[i,2] <- "WALKING_DOWNSTAIRS"} 
            if (projMergeAct[i,2]==4) {projMergeAct[i,2] <- "SITTING"}
            if (projMergeAct[i,2]==5) {projMergeAct[i,2] <- "STANDING"}
            if (projMergeAct[i,2]==6) {projMergeAct[i,2] <- "LAYING"}
    }
#4. Appropriately labels the data set with descriptive variable names. 
names(projMergeAct)[3]<-"tBodyAcc-mean-X"
names(projMergeAct)[4]<-"tBodyAcc-mean-Y"
names(projMergeAct)[5]<-"tBodyAcc-mean-Z"
names(projMergeAct)[6]<-"tBodyAcc-std-X"  
names(projMergeAct)[7]<-"tBodyAcc-std-Y"
names(projMergeAct)[8]<-"tBodyAcc-std-X"

#5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
projMerge9<-factor(projMerge8[2],c(1:6),act.names)

# WRITE THE FILE:
data <- read.table(file_path, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
View(data)