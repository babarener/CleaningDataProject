library(dplyr)
library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(url, zipFile, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(zipFile)
}

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
required_features <- grep("^.*mean\\(\\).*$|^.*std\\(\\).*$", features$feature, value = TRUE)

head(required_features)
length(required_features)
print("length should be 66")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read Training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")

# Read Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")

# Merge training data to one table and Merge testing data to one table
train_data <- cbind(subject_train, y_train, x_train)
test_data  <- cbind(subject_test, y_test, x_test)
# Merge training and testing data into one table
merged_data <- rbind(train_data, test_data)

#Rename the table 
colnames(merged_data) <- c("Subject", "Activity", features$feature)

head(merged_data)
dim(merged_data)
print("merged_Data should have 563 cols. col1 store the person who conduct 
      the activity labeled 1 - 30. Col2 store the activity
      the person did labeled 1 - 6. Col3 - 563 are the 561 measurements")

selected_data <- merged_data[, c(1, 2, required_features)]



