Getting and Cleaning Data Course Project 
==========

This repository contains a script to run a basic analysis on the Human Activity Recognition data from:

[Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* * *

Running the Script
---------

Steps to produce the analysis summary:

1. [Download the dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Extract zipped dataset to any location
3. Set your R working directory to the extracted directory "UCI HAR Dataset"
4. Copy run_analysis.R script to the extracted directory "UCI HAR Dataset"
5. Run the script: source("run_analysis.R")

As a result you get the "summary.txt" file in your working directory.

* * *

Code Book
---------

Every row in the "summary.txt" corresponds to the observation for a single subject and a single activity type.

First two columns indicate the subject and activity type.

Rest of the columns are the values for the following types of measurements:

* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Measurements above are followed by "mean" or "std" to denote mean or standard deviation respectively.

X, Y or Z in the end of the column names are used to denote 3-axial signals in the X, Y and Z directions.

