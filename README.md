# getting-cleaning-data
Repo for the Coursera Getting and Cleaning Data course project 


The run_analysis.R script creates a tidy set of the mean and standard deviation measurements from the original UCI Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

In the section identified as Step 1, the test, training, and subject data files are downloaded and read. The test and training sets are joined together. At this point the activity labels, measurements, and subjects are still in separate files.

In the section identified as Step 2, the features file, which includes the descriptions of each measurement variable, is read and a boolean vector is created to identify the particular measurements that are mean or standard deviations. Using that boolean vector, the measurement values and the measurement labels are subsetted to just the mean and standard deviations.

In the section identified as Step 3, the activity labels are translated from one of the six numeric values to the English word describing the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). In addition the column name is changed to "activities".

In the section identified as Step 4, the measurement variable names are modified to be more descriptive and meet with the guidelines provided by the instructors and the norms of the the class members. (I personally find the standards a bit hard to read but am going with the consensus here.)

In the section identified as Step 5, the tidy data set in put together that includes the subjects, activities, and measurements. 

Then the dplyr package is loaded, and a new dataset, tidy_ds2 is created that summarises the data, providing the average of each variable for each activity and each subject.

The new tidy_ds2 data file is then written to course_project.txt using write.table and row.names = TRUE per the instructions. 
