

# Getting and Cleaning Data Project
Ashwin kumar Myakalwar

## Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

## Source Data
A full description of the data used in this project can be found at The UCI Machine Learning Repository

The source data for this project can be found here.

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.



# Introduction
The script run_analysis.R performs the 5 steps described in the course project's definition.

### I. Merges the training and the test sets to create one data set.
* First, all the similar data is merged using the rbind() function. 
* created corresponding datasets
### II. Extract only the measurements on the mean and standard deviation for each measurement
* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset.
### III. Use descriptive activity names to name the activities in the data set
* After extracting these columns, they are given the correct names, taken from features.txt.
### IV. Appropriately label the data set with descriptive variable names
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
### V. Create a second, independent tidy data set with the average of each variable for each activity and each subject
* generated a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called mean_data.txt, and uploaded to this repository.

## Outputs:
* x_tr_data, y_tr_data, x_te_data, y_te_data, sub_tr_data and sub_te_data contain the data from the downloaded files.
* x_data, y_data and sub_data merge the previous datasets to further analysis.
* features contains the correct names for the x_data dataset, which are applied to the column names stored in * * 
* mean_n_std_features, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the activities variable.
all_data merges x_data, y_data and subject_data in a big dataset.
           Finally,mean_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
