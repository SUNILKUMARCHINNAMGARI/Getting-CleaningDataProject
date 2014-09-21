README DOCUMENT FOR THE GETTING & CLEANING DATA PROJECT
===========================

This document explains the methodology followed for summarizing the samsung dataset.This document is highly recommended to be read in tandem with codebook.md and run_analysis.R file. 

A brief description of the dataset is as below :
-----------------------------------------------

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

What does the code in run_analysis.R do :
-----------------------------------------
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Pseudocode 
-----------
The datasets are downloaded from web https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unzipping the file and copying the required files from the folders and subfolders of unzipped content into the working directory of RStudio.
Read training dataset X,Y,Subject components into a seperate dataframes and merge then together using cbind.
Read test dataset X,Y,Subject components into a seperate dataframes and merge then together using cbind.
Combine training and test datasets to form a full dataset using rbind.
Read the features.txt file that contains the column names, extract the column names from the resultant dataframe and apply them as column names to full dataset.
Amend the last two column names in full dataset as activity and subject 
The activity column consists ordinal values. Replace the oridinal values by actual values. The actual descriptive values for the ordinal values exists is activity_labels.txt file. To do this step, read the file and then apply a inner join between activity column in full dataset and id column in dataframe resulting from activity_labels.txt file read.
Replace the activity name column in full dataset with the new column created by the join.Delete the new column from the full dataset dataframe.
Offline, verify the fulldataset dataset and identify column numbers that are mean and standard deviation related. You could grep the column names in R program to do this but I have not done this.
Use the identified column numbers and subset the full dataset dataframe. Refer codebook for the column descriptions of the resulting dataset post subsetting.
Generate a new dataframe which is a result of summarizing (through averaging) the columns by subject and by activity.
Clean up the column headings (except for the first two columns - subject and activity) so it reflects the keyword Avg in the heading (nice to have)
Write the resulting dataframe as tidydata.txt
