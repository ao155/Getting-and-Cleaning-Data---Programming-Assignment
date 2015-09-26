#CodeBook for the script "run_analysis.R"
This code book describes the data, the variables, and any transformations or work that was performed to clean up the data

## Data
The data represents the results of the following experiment run by the Università degli Studi di Genova and the Universitat Politècnica de Catalunya:
The experiment has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The data was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
A full description of the data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data is split into test data (30%) and training data (70%).

The "run_analysis.R" script uses the following files from the downloaded folder:
*X_test: Test set
*Y_test: Test Labels
*Subject_test: Each row identifies the subject who performed the activity for each window sample. 
*X_train: Training set
*Y_train: Training labels
*Subject_train: Each row identifies the subject who performed the activity for each window sample. 
*features: List of all features
*activity_labels: Links the class labels with their activity name.


## Variables
The output of the "run_analysis.R" script contains the following variables:
* Activity: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* Subject: The ID for each individual person (numbers from 1 to 30)
* 79 different measures (e.g. tBodyAcc-mean()-x): these are the mean values of the measures from the experiment by subject (person) and activity


## Data Cleaning and Transformation
In order to build the output data set, the following data cleaning tasks where conducted:
* Add the labels (Y_test, Y_train) to the main data sets (X_text, X_train)
* Add the subject IDs (Subject_test, Subject_train) to the main data sets (X_text, X_train)
* Append the test and training data sets
* Format the subject IDs as factor
* Format the features as character
* Subset the data set to keep only the measurements with "mean or "std"
* Add the activity descriptions and rename the activity column
* Remove the activity codes
* Add the descriptions of the measurement columns
* Calculate the mean of each measurement by subject and activity
* Rename the grouping variables in the final data set

