# Getting and Cleaning Data Project

## Overview

This project is part of the Coursera "Getting and Cleaning Data" course. It demonstrates the process of downloading, cleaning, transforming, and summarizing a dataset into a tidy format suitable for analysis.

The data comes from the [UCI Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which includes accelerometer and gyroscope measurements collected from 30 participants performing six activities.

## Files Included

- `run_analysis.R`: R script that performs all data cleaning and transformation.
- `tidy_data.txt`: Final tidy dataset with the average of each selected variable for each activity and subject.
- `CodeBook.md`: Detailed descriptions of the variables and transformations.
- `README.md`: Explanation of the project, script functionality, and file structure.

## How to Run

1. Open `run_analysis.R` in R or RStudio.
2. Make sure you have an internet connection — the script will automatically download and unzip the dataset if it’s not already present.
3. The script will:
   - Merge the training and test datasets
   - Extract only mean and standard deviation features
   - Assign descriptive activity names
   - Create a tidy summary with averages for each variable by subject and activity
4. The output file `tidy_data.txt` will be created in your working directory.

## Project Requirements Addressed

- 1. Merges the training and the test sets to create one data set.
- 2. Extracts only the measurements on the mean and standard deviation.
- 3. Uses descriptive activity names.
- 4. Labels the data set with descriptive variable names.
- 5, Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

