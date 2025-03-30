# CodeBook

This CodeBook describes the variables, data, and transformations performed for the final tidy dataset `tidy_data.txt` as part of the Getting and Cleaning Data course project.

---

## Source Data

The original dataset is the **Human Activity Recognition Using Smartphones Dataset** provided by the UCI Machine Learning Repository:

> [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Direct download link used in the script**:
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments involved 30 subjects (age 19–48) performing six activities while carrying a Samsung Galaxy S II smartphone. The embedded accelerometer and gyroscope captured 3-axial linear acceleration and angular velocity at 50Hz.

Each observation (windowed sample) includes 561 features derived from time and frequency domain signals.

---

## Raw Files Used

- `features.txt` — List of 561 original feature names
- `activity_labels.txt` — Mapping of activity codes (1–6) to descriptive activity names
- `X_train.txt`, `X_test.txt` — Feature data
- `y_train.txt`, `y_test.txt` — Activity labels
- `subject_train.txt`, `subject_test.txt` — Subject IDs

---

## Steps Performed

1. **Download and Unzip Data**
   - Script checks for and downloads the original dataset ZIP if not already available.
   
2. **Read and Merge Data**
   - Training and test sets are read and combined into one dataset with 563 columns: `Subject`, `Activity`, and 561 features.

3. **Extract Mean and Standard Deviation Variables**
   - Only variables with names containing `mean()` or `std()` are extracted.
   - This results in 66 feature columns, in addition to `Subject` and `Activity`.

4. **Assign Descriptive Activity Names**
   - Numeric activity codes are converted into labels using `factor()`:
     - WALKING
     - WALKING_UPSTAIRS
     - WALKING_DOWNSTAIRS
     - SITTING
     - STANDING
     - LAYING

5. **Create Tidy Data Set**
   - Data is grouped by `Subject` and `Activity`.
   - For each pair, the **mean of each of the 66 measurements** is calculated.
   - The result is a tidy dataset with 180 observations (30 subjects × 6 activities) and 68 variables.

---

## Variables in `tidy_data.txt`

- **Subject** (integer): Identifier for each of the 30 participants
- **Activity** (factor): Descriptive activity name as listed above
- **66 measurement variables** (numeric): Average values of original features related to mean and standard deviation

### Variable Naming Conventions

Original variable names (from `features.txt`) were preserved, with special characters intact (e.g., `tBodyAcc-mean()-X`). These names indicate:

- `t` or `f`: Time or Frequency domain
- `Body` / `Gravity`: Source of the signal
- `Acc` / `Gyro`: Accelerometer or Gyroscope
- `Jerk`: Jerk signals (rate of change)
- `Mag`: Magnitude
- `mean()` / `std()`: Measurement type
- `-X`, `-Y`, `-Z`: Directional axis

### Example Variable Names

| Variable Name          | Description                                               |
|------------------------|-----------------------------------------------------------|
| `tBodyAcc-mean()-X`    | Mean of time-domain body acceleration along X-axis        |
| `fBodyGyro-std()-Z`    | Std. dev. of frequency-domain gyroscope signal on Z-axis |
| `tGravityAcc-mean()-Y` | Mean of time-domain gravity acceleration on Y-axis        |

---

## Units

- **Accelerometer**: Gravitational units ("g")
- **Gyroscope**: Radians per second
- All features are **normalized and bounded within [-1, 1]**

---

## Output File

- **File Name**: `tidy_data.txt`
- **Format**: Tab-delimited text file
- **Rows**: 180 (30 subjects × 6 activities)
- **Columns**: 68 (1 Subject + 1 Activity + 66 averaged features)
- **No row names** (per project instructions)

---

## Summary

This tidy dataset is ready for further statistical analysis or machine learning tasks. It meets all tidy data principles: each variable forms a column, each observation a row, and each type of observational unit a table.

