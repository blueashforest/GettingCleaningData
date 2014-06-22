## Course Project: Getting and Cleaning Data
## Site where the data was obtained : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## Data for the project was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## Preliminaries for the project: Install reshape2 package, install.packages("reshape2")
setwd("/Users/redrock/GettingCleaningData")
library(reshape2)
## Download the zip file containing the data and unzip the file in your working directory.  Unzip will create a directory called
## UCI HAR Dataset which contains the data for the project
## Read Test Data
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
## Read Train Data
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
## Read features data
featureData <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE)
## Read activity data
activityData <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
## Merge test datasets
testmerged <- cbind(Xtest, ytest, subjecttest)
## Merge train datasets
trainmerged <- cbind(Xtrain, ytrain, subjecttrain)
## 1. Merge the training and the test sets to create one data set.
mergedData <- rbind(testmerged, trainmerged)
## Create a dataset with column names
colnames(mergedData) <- c(as.character(featureData[ , 2]), "activity_label", "subject")
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## Select only the activities containing mean()
title_with_mean <- grep("mean\\(\\)", colnames(mergedData), value=TRUE)
## Select only the activities containing std()
title_with_std <- grep("std\\(\\)", colnames(mergedData), value=TRUE)
## Merge columns with mean and std with columns subject and activity_label
mean_std_merged <- mergedData[, c(title_with_mean, title_with_std, "activity_label", "subject")]
## 3. Use descriptive activity names to name the activities in the data set
mean_std_merged$activity_label <- factor(mean_std_merged$activity_label, labels=activityData$V2)
## 4. Appropriately labels the data set with descriptive variable names.
colnames(mean_std_merged) <- gsub("-", "", colnames(mean_std_merged))
colnames(mean_std_merged) <- gsub("\\(\\)", "", colnames(mean_std_merged))
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meltData <- melt(mean_std_merged, id=c("activity_label", "subject"))
averageData <- dcast(meltData, activity_label + subject ~ variable, mean)
## Write to a file
write.csv(averageData, "./tidy_data.txt", row.names=FALSE)