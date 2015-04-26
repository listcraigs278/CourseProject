---
title: 	"Tidy Human Activity Recognition Using Smartphones Dataset Codebook"
author: “Student”
date: 	"2015-04-23"
output:	tidy-HAR.txt, tidy-HAR-Means.txt
---
  
## Project Description
This project takes as its input the Human Activity Recognition Using Smartphones Dataset (version 1.0) available from ww.smartlab.ws. This data is transformed into:
- a dataset that combines both the training and test datasets.
- a dataset containing the means of each variable for each subject performing each activity.

##Data processing
Data processing was conducting using the R statistical software. In order to improve the usability of the R scripts provided to tidy the data, no additional R libraries are required to be installed. Pleas


###Collection of the raw data
The raw data is provided as a zip file that can be downloaded from the UCI website (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Once the zip file has been uncompressed the following directory tree structure is created:

(current directory)--- UCI HAR Dataset -----> test   -----> Inertial Signals (unused)
                                         |             |--> subject_test.txt
                                         |             |--> X_test.txt
                                         |             |--> y_test.txt
                                         |--> train  -----> Inertial Signals (unused)
                                         |             |--> subject_train.txt
                                         |             |--> X_train.txt
                                         |             |--> y_train.txt
                                         |
                                         |--> activity_labels.txt
                                         |--> features.txt
                                         |--> features_info.txt
                                         |--> README.txt


##Creating the tidy datafile
The R scripts provided create two text files (tidy-HAR.txt, tidy-HAR-Means.txt) in the ‘UCI HAR Dataset’ directory. 

###Cleaning of the data
The provided scripts attempt to tidy the HAR dataset. The steps performed to achieve this include:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Resulting Dataset Description

### Variable Name Transformation
The variables names have been transformed as follows:

1) The t and f letter that prefixes each variable in the original dataset have been expanded to Time and Fourier respectively.

2) Dots (.) have been introduced to complement the Camel casing of the variable names and improve readability.

3) The shortened variable names in the original dataset have been expanded to long form. i.e. Acc, Gyro, Mag have been expanded to Accelerometer, Gyroscope and Magnitude respectively.

4) Extraneous characters such as the dashes and parenthesis that existed in variable in the original dataset have been removed.

5) The words ‘mean’ and ‘std’ appearing in variables in the original dataset have been capitalized to adhere to camel case format.

### Dataset Variable Descriptions
The resulting dataset can be described as follows.
Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
- Class of the variable
- Unique values/levels of the variable
- Unit of measurement (if no unit of measurement list this as well)
- In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels).

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

#### Aggregate Variables
      
##### Type
- A factor variable that indicates the type of data this row corresponds to (i.e. Testing or Training).

##### Subject 
- an integer identifier between 1 and 30 that identifies the subject this datum pertains to.

##### Activity
- a descriptive activity Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIR.

#### Time Domain Variables
##### Mean Body Triaxial Accelerometer Measurements (Numeric)
Time.Body.Accelerometer.Mean-X
Time.Body.Accelerometer.Mean-Y
Time.Body.Accelerometer.Mean-Z

##### Standard Deviation Body Triaxial Accelerometer Measurements (Numeric)
Time.Body.Accelerometer.Std-X
Time.Body.Accelerometer.Std-Y
Time.Body.Accelerometer.Std-Z

##### Mean Gravity Triaxial Accelerometer Measurements (Numeric)
Time.Gravity.Accelerometer.Mean-X
Time.Gravity.Accelerometer.Mean-Y
Time.Gravity.Accelerometer.Mean-Z

##### Standard Deviation Gravity Triaxial Accelerometer Measurements (Numeric)
Time.Gravity.Accelerometer.Std-X
Time.Gravity.Accelerometer.Std-Y
Time.Gravity.Accelerometer.Std-Z

##### Mean Body Triaxial Accelerometer Jerk Measurements (Numeric)
Time.Body.Accelerometer.Jerk.Mean-X
Time.Body.Accelerometer.Jerk.Mean-Y
Time.Body.Accelerometer.Jerk.Mean-Z

##### Standard Deviation Body Triaxial Accelerometer Jerk Measurements (Numeric)
Time.Body.Accelerometer.Jerk.Std-X
Time.Body.Accelerometer.Jerk.Std-Y
Time.Body.Accelerometer.Jerk.Std-Z

##### Mean Body Triaxial Gyroscope Measurements (Numeric)
Time.Body.Gyroscope.Mean-X
Time.Body.Gyroscope.Mean-Y
Time.Body.Gyroscope.Mean-Z

##### Standard Deviation Body Triaxial Gyroscope Measurements (Numeric)
Time.Body.Gyroscope.Std-X
Time.Body.Gyroscope.Std-Y
Time.Body.Gyroscope.Std-Z

##### Mean Body Gyroscope Triaxial Jerk Measurements (Numeric)
Time.Body.Gyroscope.Jerk.Mean-X
Time.Body.Gyroscope.Jerk.Mean-Y
Time.Body.Gyroscope.Jerk.Mean-Z

##### Standard Deviation Body Gyroscope Triaxial Measurements (Numeric)
Time.Body.Gyroscope.Jerk.Std-X
Time.Body.Gyroscope.Jerk.Std-Y
Time.Body.Gyroscope.Jerk.Std-Z

##### Mean Body Magnitude Measurements for Accelerometer & Gyroscope (Numeric)
Time.Body.Accelerometer.Magnitude.Mean
Time.Body.Accelerometer.Jerk.Magnitude.Mean
Time.Body.Gyroscope.Magnitude.Mean
Time.Body.Gyroscope.Jerk.Magnitude.Mean

##### Standard Deviation Body Magnitude Measurements for Accelerometer & Gyroscope (Numeric)
Time.Body.Accelerometer.Magnitude.Std
Time.Body.Accelerometer.Jerk.Magnitude.Std
Time.Body.Gyroscope.Magnitude.Std
Time.Body.Gyroscope.Jerk.Magnitude.Std

#### Frequency Domain Variables 
##### Mean Body Triaxial Accelerometer Measurements (Numeric)
Fourier.Body.Accelerometer.Mean-X
Fourier.Body.Accelerometer.Mean-Y
Fourier.Body.Accelerometer.Mean-Z

##### Standard Deviation Body Triaxial Accelerometer Measurements (Numeric)
Fourier.Body.Accelerometer.Std-X
Fourier.Body.Accelerometer.Std-Y
Fourier.Body.Accelerometer.Std-Z

##### Mean Body Triaxial Accelerometer Jerk Measurements (Numeric)
Fourier.Body.Accelerometer.Jerk.Mean-X
Fourier.Body.Accelerometer.Jerk.Mean-Y
Fourier.Body.Accelerometer.Jerk.Mean-Z

##### Standard Deviation Body Triaxial Accelerometer Jerk Measurements (Numeric)
Fourier.Body.Accelerometer.Jerk.Std-X
Fourier.Body.Accelerometer.Jerk.Std-Y
Fourier.Body.Accelerometer.Jerk.Std-Z

##### Mean Body Gyroscope Triaxial Measurements (Numeric)
Fourier.Body.Gyroscope.Mean-X
Fourier.Body.Gyroscope.Mean-Y
Fourier.Body.Gyroscope.Mean-Z

##### Standard Deviation Body Gyroscope Triaxial Measurements (Numeric)
Fourier.Body.Gyroscope.Std-X
Fourier.Body.Gyroscope.Std-Y
Fourier.Body.Gyroscope.Std-Z

##### Mean Body Magnitude Measurements for Accelerometer & Gyroscope (Numeric)
Fourier.Body.Accelerometer.Magnitude.Mean
Fourier.Body.Body.Accelerometer.Jerk.Magnitude.Mean
Fourier.Body.Body.Gyroscope.Magnitude.Mean
Fourier.Body.Body.Gyroscope.Jerk.Magnitude.Mean

##### Standard Deviation Body Magnitude Measurements for Accelerometer & Gyroscope (Numeric)
Fourier.Body.Accelerometer.Magnitude.Std  
Fourier.Body.Body.Accelerometer.Jerk.Magnitude.Std
Fourier.Body.Body.Gyroscope.Magnitude.Std
Fourier.Body.Body.Gyroscope.Jerk.Magnitude.Std


# Appendix - List of extracted rows.
tBodyAcc-meanX	numeric
tBodyAcc-meanY	numeric
tBodyAcc-meanZ	numeric
tBodyAcc-stdX	numeric
tBodyAcc-stdY	numeric
tBodyAcc-stdZ	numeric
tGravityAcc-meanX	numeric
tGravityAcc-meanY	numeric
tGravityAcc-meanZ	numeric
tGravityAcc-stdX	numeric
tGravityAcc-stdY	numeric
tGravityAcc-stdZ	numeric
tBodyAccJerk-meanX	numeric
tBodyAccJerk-meanY	numeric
tBodyAccJerk-meanZ	numeric
tBodyAccJerk-stdX	numeric
tBodyAccJerk-stdY	numeric
tBodyAccJerk-stdZ	numeric
tBodyGyro-meanX	numeric
tBodyGyro-meanY	numeric
tBodyGyro-meanZ	numeric
tBodyGyro-stdX	numeric
tBodyGyro-stdY	numeric
tBodyGyro-stdZ	numeric
tBodyGyroJerk-meanX	numeric
tBodyGyroJerk-meanY	numeric
tBodyGyroJerk-meanZ	numeric
tBodyGyroJerk-stdX	numeric
tBodyGyroJerk-stdY	numeric
tBodyGyroJerk-stdZ	numeric
tBodyAccMag-mean()	numeric
tBodyAccMag-std()	numeric
tGravityAccMag-mean()	numeric
tGravityAccMag-std()	numeric
tBodyAccJerkMag-mean()	numeric
tBodyAccJerkMag-std()	numeric
tBodyGyroMag-mean()	numeric
tBodyGyroMag-std()	numeric
tBodyGyroJerkMag-mean()	numeric
tBodyGyroJerkMag-std()	numeric
fBodyAcc-meanX	numeric
fBodyAcc-meanY	numeric
fBodyAcc-meanZ	numeric
fBodyAcc-stdX	numeric
fBodyAcc-stdY	numeric
fBodyAcc-stdZ	numeric
fBodyAccJerk-meanX	numeric
fBodyAccJerk-meanY	numeric
fBodyAccJerk-meanZ	numeric
fBodyAccJerk-stdX	numeric
fBodyAccJerk-stdY	numeric
fBodyAccJerk-stdZ	numeric
fBodyGyro-meanX	numeric
fBodyGyro-meanY	numeric
fBodyGyro-meanZ	numeric
fBodyGyro-stdX	numeric
fBodyGyro-stdY	numeric
fBodyGyro-stdZ	numeric
fBodyAccMag-mean()	numeric
fBodyAccMag-std()	numeric
fBodyBodyAccJerkMag-mean()	numeric
fBodyBodyAccJerkMag-std()	numeric
fBodyBodyGyroMag-mean()	numeric
fBodyBodyGyroMag-std()	numeric
fBodyBodyGyroJerkMag-mean()	numeric
fBodyBodyGyroJerkMag-std()	numeric