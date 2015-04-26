
# Please Note: This script is assumed to be run in the data directory.

#function to check if files are missing...
fileCheck<-function(filename){
  if (!file.exists(filename)){
    err1<-paste("Error: Missing '", filename, "' file...", sep="")
    err2<-"Please make sure you are running this script inside the data directory."
    msg<-paste(err1,err2, sep=" ")
    stop(msg)
  }else{
    TRUE
  }
}


rename_headers<-function(header2){
  #replace: ^t -> Time.
  header2<-gsub("^t", "Time.", header2)
  
  #replace: ^f -> Fourier.
  header2<-gsub("^f", "Fourier.", header2)
  
  #replace: Body -> Body. # adding dot separator...
  header2<-gsub("Body", "Body.", header2)
  
  #replace: Gravity -> Gravity. # adding dot separator....
  header2<-gsub("Gravity", "Gravity.", header2)
  
  #replace: Acc -> Accelerometer.
  header2<-gsub("Acc", "Accelerometer.", header2)
  
  #replace: Gyro -> Gyroscope.
  header2<-gsub("Gyro", "Gyroscope.", header2)
  
  #replace: Jerk -> Jerk.
  header2<-gsub("Jerk", "Jerk.", header2)
  
  #replace: Mag -> Magnitude.
  header2<-gsub("Mag", "Magnitude.", header2)
  
  #replace: -mean()- -> Mean.
  header2<-gsub("-mean\\(\\)", "Mean", header2)
  
  #replace: -std()- -> Mean.
  header2<-gsub("-std\\(\\)", "Std", header2)
  
  # return the new header...
  header2
}

run_analysis<-function(){
  # list of files to check...
  dataFiles<-c("features.txt", "activity_labels.txt", "train/X_train.txt", "train/y_train.txt", "train/subject_train.txt", "test/X_test.txt", "test/y_test.txt", "test/subject_test.txt")
  
  # checking for the availability of the data files...
  lapply(dataFiles, fileCheck)
  
  # Reading Generic Files...
  headers<-read.table(file="features.txt", header=F) # the features file...
  activities<-read.table(file="activity_labels.txt", header=F) # the activity labels...
  
  # Reading the training data...
  df1.train<-read.table(file="train/X_train.txt", header=F)
  df2.train<-read.table(file="train/y_train.txt", header=F)
  subjects.train<-read.table(file="train/subject_train.txt", header=F)
  
  # Reading test data...
  df1.test<-read.table(file="test/X_test.txt", header=F)
  df2.test<-read.table(file="test/y_test.txt", header=F)
  subjects.test<-read.table(file="test/subject_test.txt", header=F)
  
  # assign the feature headers to the training and testing datasets...
  colnames(df1.train)<-headers$V2
  colnames(df1.test)<-headers$V2
  
  # Step 2: Extracting only the measurements on the mean and standard deviation for each measurement.
  # Note: Mean frequency is NOT included.
  stdCols<-grep("*std()-*",headers$V2)
  mean.std.Cols<-grep("*mean\\(\\)-*|*std()-*",headers$V2) # list of mean and std columns...
  
  # creating new datasets that only include filtered columns...
  x.train<-df1.train[,mean.std.Cols] 
  x.test<-df1.test[,mean.std.Cols] 
  
  # before we can combine the testing and training datasets we need to add a label that distinguishes them...
  # therefore... adding a type label to each dataset.
  x.train$Type<-"TRAIN" # 'train'ing type label...
  x.test$Type<-"TEST" # 'test'ing type label...
  
  # adding subject columns to the datasets...
  x.train$Subject<-subjects.train$V1
  x.test$Subject<-subjects.test$V1
  
  # Step 3: Converting column names to something more descriptive.
  y.train<-merge(y=df2.train, x=activities, by="V1", all.y = TRUE)
  y.test<-merge(y=df2.test, x=activities, by="V1", all.y = TRUE)
  
  #write.table(y.train, file="y-train.txt", row.name=FALSE)
  #write.table(y.test, file="y-test.txt", row.name=FALSE)
  
  # attaching activity columns to the datasets...
  x.train$Activity<-y.train$V2
  x.test$Activity<-y.test$V2
  
  # Step 1: Finally, merging the training and the test sets to create one data set.
  final.data<-rbind(x.train, x.test)
  
  # Convert the type field to a factor variable...
  final.data$Type <- as.factor(final.data$Type)
  
  # Step 4: Appropriately labels the data set with descriptive variable names.
  header2<-rename_headers(names(final.data))
  
  colnames(final.data)<-header2
  #head(final.data)
  #names(final.data)
  
  # rearrange the columns so that the subject, activity, data are first...
  names(final.data[,c(68,69,67,1:66)])
  names(final.data)
  write.table(final.data, file="tidy-HAR.txt", row.name=FALSE)
   
  # 5./ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  summary.data<-aggregate(final.data[,1:66], by=list(Subject=final.data$Subject,Activity=final.data$Activity), FUN=mean, na.rm=T)
  
  write.table(summary.data, file="tidy-HAR-Means.txt", row.name=FALSE)
  
}

head(final.data$Activity)
