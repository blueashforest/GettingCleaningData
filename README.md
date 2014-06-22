# Getting and Cleaning Data Course Project #
## Script: `run_analysis.R` ##

### Goal of the Script: `Create a tidy data set` ###

### Steps: ###
<ol><li>Site where the data was obtained : <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a></li>
<li>Data for the project was downloaded from: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a></li>
<li>Preliminaries for the project: Install reshape2 package, install.packages("reshape2")</li>
<li>Download the zip file containing the data and unzip the file in your working directory.  Unzip will create a directory called UCI HAR Dataset which contains the data for the project</li>
<li>Read Test Data</li>
<li>Read Train Data</li>
<li>Read features data</li>
<li>Read activity data</li>
<li>Merge test data sets</li>
<li>Merge train data sets</li>
<li>Merge the training and the test sets to create one data set</li>
<li>Create a dataset with column names</li>
<li>Extract only the measurements on the mean and standard deviation for each measurement</li> 
<li>Select only the activities containing mean()</li>
<li>Select only the activities containing std()</li>
<li>Merge columns with mean and std with columns subject and activity_label</li>
<li>Use descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive variable names</li>
<li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject</li>
<li>Write to a file</li></ol>

### How to Run the Script: ###
<ol><li>Make sure that the working directory is set</li>
<li>On the prompt type</li>
`>source("run_analysis.R")`
<li>Once the script is completed the prompt will return.</li>  
`>`
<li>Now, if you check your working directory, there will be a newly created file called, `tidy_data.txt`</li>
<li>Open and verify the data</li></ol>
