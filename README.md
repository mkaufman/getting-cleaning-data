# getting-cleaning-data
Repo for the Coursera Getting and Cleaning Data Course Project 

## Project Summary
The run_analysis.R script creates a tidy set of the mean and standard deviation measurements from the original UCI Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). From the tidy set, it creates a second tidy data set with the average of each variable for each activity and subject. 

## Course Project Instructions
You will be required to submit:
* a tidy data set as described below
* a link to a Github repository with your script for performing the analysis
* a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## My Interpretation

I interpreted the assignment instructions to "Extracts only the measurements on the mean and standard deviation for each measurement" to mean only those measurements that were calculated with mean(): Mean value and std(): Standard deviation.


## The Data Files
The script assumes that you have downloaded and extracted the zip file for the project data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into your working directory, LEAVING THE STRUCTURE OF THE EXTRACTED ZIP FILE INTACT.

The README.txt included with the data files includes a full description of all the files, but the one's that my script uses are described below

- 'features.txt': List of all features label variables, i.e. descriptions of the measurements. The format of these will be modified by the script to be more readable and conform to our tidy data standards.

- 'activity_labels.txt': Links the activity labels (y_train.txt and y_test.txt) with their English activity name.

- 'train/X_train.txt': Training set. Measurements for the training set of subjects.

- 'train/y_train.txt': Training labels. Corresponds to the English descriptions in activity_labels.txt. Its range is from 1 to 6.

- 'test/X_test.txt': Test set. Measurements for the test set of subjects.

- 'test/y_test.txt': Test labels. Corresponds to the English descriptions in activity_labels.txt. Its range is from 1 to 6.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## How My Scripts Work

###Step 1
In the section identified in my script as Step 1, the test and training measurements and labels and the subject data files are read. The test and training sets are joined together. At this point the activity labels, measurements, and subjects are still in separate data frames (y_complete, x_complete, and subject_complete, respectively). 

I also take the opportunity to name the subject_complete data with a more descriptive name, "subject", that will meet the requirements of a tidy set.

###Step 2
In the section identified as Step 2, the features file, which includes the descriptions of each measurement variable, is read and a boolean vector is created to identify the particular measurements that are mean or standard deviations. Using that boolean vector (boolean_vector), the measurement values and the measurement labels are subsetted to just the mean and standard deviations (x_subset and labels_subset, respectively).

###Step 3
In the section identified as Step 3, the activity labels are translated from one of the six numeric values to the English word describing the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). In addition the column name is changed to "activities" to meet the requirements of a tidy set.

###Step 4
In the section identified as Step 4, the feature/measurement variable labels are modified to be more descriptive and meet with the guidelines provided by the instructors and the norms of the the class members to meet the requirements of a tidy data set. I've made the names lowercase, removed non-alphanumerics, and expanded most abbreviations to the full Englishword. (I personally find the standards a bit hard to read, and would prefer camel case but am going with the consensus here.)

The cleaned up feature label names are assigned as the column names to our measurement data frame, x_subset.

###Step 5
In the section identified as Step 5, a tidy data set in put together that includes the subjects, activities, and measurements by combining y_complete, x_subset, and subject_complete.  

The dplyr package is loaded, and a new dataset, tidy_ds2 is created that summarises the data, providing the average of each variable for each activity and each subject.

The new tidy_ds2 data file is then written to course_project.txt using write.table and row.names = FALSE per the instructions. 

The data file meets the requirements of tidy data:
1. Each variable measured is in one column
2. Each different observation of that variable is in a different row
3. There is one table for each "kind" of variable

More information on the variables is included in the accompanying CodeBook.md