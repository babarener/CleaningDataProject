# Load necessary libraries
library(dplyr)
library(data.table)

# Download and unzip dataset if not already present
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(url, zipFile, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(zipFile)
}

# Load features and identify features containing mean() or std()
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
required_features <- grep("^.*mean\\(\\).*$|^.*std\\(\\).*$", features$feature, value = TRUE)

print("length of required_features should be 66")

#Load activity labels
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

print("merged_Data should have 563 cols. col1 store the person who conduct 
      the activity labeled 1 - 30. Col2 store the activity
      the person did labeled 1 - 6. Col3 - 563 are the 561 measurements")

# Extracts only the measurements on the mean and standard deviation for each measurement. 
selected_data <- merged_data[, c("Subject", "Activity", required_features)]
print("selected_data should have 68 columns: Subject, Activity, and 66 features related to mean() and std().")

# Convert Activity column from labels to descriptive names
selected_data$Activity <- factor(selected_data$Activity, 
                                 levels = activity_labels$code, 
                                 labels = activity_labels$activity)

# Create an independent table set with the average of each variable
# for each activity and each subject. Convert to tidy long format.
tidy_data <- selected_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)
tidy_data_dt <- as.data.table(ungroup(tidy_data))
tidy_data_long <- melt(tidy_data_dt,
                       id.vars = c("Subject", "Activity"),
                       variable.name = "Feature",
                       value.name = "Average")

# Save final tidy dataset
write.table(tidy_data_long, "tidy_data.txt", row.name = FALSE)




