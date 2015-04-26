==================================================================
R Script to tidy and summarize the Human Activity Recognition
Using Smartphones Dataset
==================================================================
The provided scripts attempt to tidy the HAR dataset. The steps performed to achieve this include:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

INCLUDED FILES:
===============

- README.txt : This file.
- run_analysis.R : The script to tidy the HAR dataset.
- Codebook.txt : Codebook that describes the variables of created dataset.

INSTRUCTIONS:
==============
1./ Download the UCI dataset from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2./ Unzip the file once the download is completed.

3./ In R source the provided ‘run_analysis.R’ into your environment.

4./ Change the working directory into the root folder of the unzip UCI dataset.

5./ Execute the script using:
> run_analysis()

