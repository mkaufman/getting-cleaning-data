#Human Activity Recognition Using Smartphones Data Set - Mean and Standard Deviation


## Study Design

The original study and data collection was performed at UCI as the Human Activity Recognition Using Smartphones Data Set. More information on that study and data set can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

My data set summarizes subsets of the original data according to the instructions for the Coursera class project for Getting and Cleaning Data. The output is a tidy data set with the average of each mean and standard deviation variable for each activity and each subject.


## Code Book

* subject 
Integer
Each row identifies one of the 30 volunteer subjects who performed the activity. The range is from 1 to 30. 

* activities
Factor
Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Identifies the particular activity for this row.

The remaining data include mean and standard deviation for each 3-axial linear acceleration and 3-axial angular velocity measurement in the original set of measurements, normalized and bounded within [-1,1]. 

* timebodyaccelerationmeanx 
* timebodyaccelerationmeany 
* timebodyaccelerationmeanz 
* timebodyaccelerationstandarddeviationx 
* timebodyaccelerationstandarddeviationy 
* timebodyaccelerationstandarddeviationz 
* timegravityaccelerationmeanx 
* timegravityaccelerationmeany 
* timegravityaccelerationmeanz 
* timegravityaccelerationstandarddeviationx 
* timegravityaccelerationstandarddeviationy 
* timegravityaccelerationstandarddeviationz 
* timebodyaccelerationjerkmeanx 
* timebodyaccelerationjerkmeany 
* timebodyaccelerationjerkmeanz 
* timebodyaccelerationjerkstandarddeviationx 
* timebodyaccelerationjerkstandarddeviationy 
* timebodyaccelerationjerkstandarddeviationz 
* timebodygyroscopemeanx 
* timebodygyroscopemeany 
* timebodygyroscopemeanz 
* timebodygyroscopestandarddeviationx 
* timebodygyroscopestandarddeviationy 
* timebodygyroscopestandarddeviationz 
* timebodygyroscopejerkmeanx 
* timebodygyroscopejerkmeany 
* timebodygyroscopejerkmeanz 
* timebodygyroscopejerkstandarddeviationx 
* timebodygyroscopejerkstandarddeviationy 
* timebodygyroscopejerkstandarddeviationz 
* timebodyaccelerationmagmean 
* timebodyaccelerationmagstandarddeviation 
* timegravityaccelerationmagmean 
* timegravityaccelerationmagstandarddeviation 
* timebodyaccelerationjerkmagmean 
* timebodyaccelerationjerkmagstandarddeviation 
* timebodygyroscopemagmean 
* timebodygyroscopemagstandarddeviation 
* timebodygyroscopejerkmagmean 
* timebodygyroscopejerkmagstandarddeviation 
* frequencybodyaccelerationmeanx 
* frequencybodyaccelerationmeany 
* frequencybodyaccelerationmeanz 
* frequencybodyaccelerationstandarddeviationx 
* frequencybodyaccelerationstandarddeviationy 
* frequencybodyaccelerationstandarddeviationz 
* frequencybodyaccelerationjerkmeanx 
* frequencybodyaccelerationjerkmeany 
* frequencybodyaccelerationjerkmeanz 
* frequencybodyaccelerationjerkstandarddeviationx 
* frequencybodyaccelerationjerkstandarddeviationy 
* frequencybodyaccelerationjerkstandarddeviationz 
* frequencybodygyroscopemeanx 
* frequencybodygyroscopemeany 
* frequencybodygyroscopemeanz 
* frequencybodygyroscopestandarddeviationx 
* frequencybodygyroscopestandarddeviationy 
* frequencybodygyroscopestandarddeviationz 
* frequencybodyaccelerationmagmean 
* frequencybodyaccelerationmagstandarddeviation 
* frequencybodyaccelerationjerkmagmean 
* frequencybodyaccelerationjerkmagstandarddeviation 
* frequencybodygyroscopemagmean 
* frequencybodygyroscopemagstandarddeviation 
* frequencybodygyroscopejerkmagmean 
* frequencybodygyroscopejerkmagstandarddeviation 
 

## License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012