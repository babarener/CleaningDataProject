# Getting and Cleaning Data Project

## Overview

This project is part of the Coursera "Getting and Cleaning Data" course. It demonstrates the process of downloading, cleaning, transforming, and summarizing a dataset into a tidy format suitable for analysis.

The data comes from the [UCI Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which includes accelerometer and gyroscope measurements collected from 30 participants performing six activities.

## Files Included

- `run_analysis.R`: R script to download, clean, summarize, and reshape the dataset.
- `tidy_data.txt`: Final tidy dataset in long format (one row per subject, activity, and feature).
- `CodeBook.md`: Description of the variables, source data, and data processing steps.
- `README.md`: Explanation of the project, script functionality, and file structure.

## How to Run

1. Open `run_analysis.R` in R or RStudio.
2. Make sure you have an internet connection — the script will automatically download and unzip the dataset if it’s not already present.
3. The script will:
   - Download and unzip the dataset if not already present.
   - Merge training and test datasets.
   - Extract only mean and standard deviation measurements.
   - Replace activity codes with descriptive labels.
   - Summarize the data by computing the average of each variable for each activity and subject.
   - Reshape the data into long format using `melt()` from `data.table`.
   - Save the final tidy dataset as `tidy_data.txt`.
   
## Output Format

The output file `tidy_data.txt` contains the following columns:
- `Subject`: Identifier for each subject (1 to 30)
- `Activity`: Descriptive activity name
- `Feature`: Name of the measurement variable
- `Average`: Average value of the measurement for each subject-activity-feature combination

This tidy structure allows easy filtering, grouping, and further analysis.

## Project Requirements Addressed

- 1. Merges the training and the test sets to create one data set.
- 2. Extracts only the measurements on the mean and standard deviation.
- 3. Uses descriptive activity names.
- 4. Labels the data set with descriptive variable names.
- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

