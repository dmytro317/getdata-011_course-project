library(dplyr)

##
## Reads UCI HAR dataset from files.
##
## Parameters:
##
##   subject.file
##     file with the subject index for every observation
##   activity.file
##     file with activity index for every observation
##   value.file
##     file with feature values for every observation
##  feature.names
##     vector with names of every feature (columns of value.file)
##  feature.filter
##     which features should be included in the resulting dataset
##  activity.names
##     descriptive names of different activities
##
## Returns:
##
##  annotated data frame with values for the selected features
##  per subject per activity
##
read.HAR.data <- function
(
  subject.file,
  activity.file,
  value.file,
  feature.names,
  feature.filter,
  activity.names
)
{
  values <- read.table(value.file, col.names = feature.names)
  values <- values[, feature.filter]

  activities <- read.table(activity.file, col.names = "Activity")
  activities <- lapply(activities, function(x) { activity.names[x] })

  subjects <- read.table(subject.file, col.names = "Subject")

  cbind(subjects, activities, values)
}

# read common files with activity names and feature names
activity.labels <- read.table("activity_labels.txt")
feature.labels <- read.table("features.txt")

# filter to extract only features that are mean or
# standard deviation of a corresponding variable
feature.filter <- grepl("mean\\(\\)", feature.labels$V2) | grepl("std\\(\\)", feature.labels$V2)

# read training data
train.data <- read.HAR.data (
  "train/subject_train.txt",
  "train/y_train.txt",
  "train/X_train.txt",
  feature.labels$V2,
  feature.filter,
  activity.labels$V2
)

# read test data
test.data <- read.HAR.data (
  "test/subject_test.txt",
  "test/y_test.txt",
  "test/X_test.txt",
  feature.labels$V2,
  feature.filter,
  activity.labels$V2
)

# concatenate training and test data together
full.data <- rbind(train.data, test.data)

# create a dataset with means for every feature for every subject and activity
summarized.data <- summarise_each(group_by(full.data, Subject, Activity), funs(mean))

# write summarized dataset to a file
write.table(summarized.data, file = "summary.txt", row.names = FALSE)
