##CodeBook for the tidy dataset
This dataset is derived from the _"Human Activity Recognition Using Smartphones Data Set"_, which was originally made avaiable here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Biggest transformation is introducing **ObservationType** and **ObservationValue** columns.

These columns where introduced due to a requirement: "_...Return tidy dataset"_.

By definition: _Tidy dataset contains single observation per row_.

##Data source
###Columns of new dataset
  
* **Person**
	* Integer representation of Person, which participated in this exact observation.
* **Activity**
	* Integer representation of Activity type of this observation.
* **ObservationType**
	* Contains name of exact variable in question.
	* Contains a set of variables, based on columns described in **Historical data** section.
* **ObservationValue**
	* Contains average of exact variable in question. 
* **ActivityName**
	* Optional, available only if function is called with `includeActivityLabels = TRUE` parameter.
	* Contains a human readable label for Activity type of this observation.

##Historical data
I refer you to the **README** and **features.txt** files in the original dataset to learn more about the feature selection for this dataset.

####Short outline:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The set of variables that were estimated in this assignment are the ones that follow these patterns:

* mean(): Mean value
* std(): Standard deviation

Reason:
Assignemnt states: _"Extracts only the measurements on the mean and standard deviation for each measurement."_

This information combined with definition of features content (**features_info.txt**) gives us these patterns.