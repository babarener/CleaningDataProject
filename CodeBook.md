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

1. **Data Loading**: All raw files are loaded into R and combined into a single dataset.
2. **Feature Selection**: Only measurements containing `mean()` or `std()` in their names were retained (66 variables).
3. **Labeling**: Activity codes were replaced with descriptive activity names.
4. **Summarization**: The dataset was grouped by `Subject` and `Activity`, and the mean of each selected feature was calculated.
5. **Reshaping**: The resulting wide dataset (one row per subject-activity pair) was reshaped into long format using `data.table::melt()`.
6. **Export**: The tidy long-format data was written to `tidy_data.txt`.

---

## Variables in Final Output (`tidy_data.txt`)

| Column    | Description                                                  |
|-----------|--------------------------------------------------------------|
| Subject   | Integer (1–30) representing each participant                 |
| Activity  | Descriptive label of the performed activity                  |
| Feature   | Feature name (e.g., `tBodyAcc-mean()-X`, `fBodyGyro-std()-Z`) |
| Average   | Mean of the feature value for that subject-activity pair     |

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

## Final Output

- **File**: `tidy_data.txt`
- **Rows**: 11,880 (30 subjects × 6 activities × 66 features)
- **Columns**: 4 (`Subject`, `Activity`, `Feature`, `Average`)

---

## Summary

This tidy dataset is ready for further statistical analysis or machine learning tasks. It meets all tidy data principles: each variable forms a column, each observation a row, and each type of observational unit a table.

