#1. Merges the training and the test sets to create one data set.

#Merging the TEST DATA :

Xtestdata<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\test\\X_test.txt")

testsubject<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\test\\subject_test.txt")

testactivity<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\test\\y_test.txt")

mergedtest<- cbind(testsubject,testactivity)

mergedtest<- cbind(mergedtest,Xtestdata)

#Merging the TRAINING DATA :

Xtraindata<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\train\\X_train.txt")

trainsubject<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\train\\subject_train.txt")

trainactivity<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\train\\y_train.txt")

mergedtrain<- cbind(trainsubject,trainactivity)

mergedtrain<- cbind(mergedtrain,Xtraindata)

#Merging the TEST and TRAIN data :

merged_train_test<-rbind(mergedtest,mergedtrain)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

feature<-read.table("D:\\EDUCATION\\DATA SCIENCE JH\\UCI HAR Dataset\\features.txt")

coln<-colnames(merged_train_test)

mean<-grep("mean",feature$V2)

std<-grep("std",feature$V2)

#extracts the measurements on mean data

select(Xtestdata,mean)

#extracts the measurements on std data

select(Xtestdata,std)



#4. Appropriately labels the data set with descriptive variable names.

features<-feature$V2

datacolnames<-append(features,"Activity",after=0)

datacolnames<-append(datacolnames,"SubjectID",after=0)

colnames(merged_train_test)<-datacolnames

#3.Uses descriptive activity names to name the activities in the data set

merged_train_test[,'Activity']<-factor(merged_train_test[,'Activity'])

levels(merged_train_test$Activity)<-c("WALKING", "WALKING_DOWNSTAIRS","WALKING_UPSTAIRS","SITTING","STANDING","LAYING")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

groupcols<- c("SubjectID","Activity")

datacols <- feature

groupedavg <- ddply(merged_train_test, groupcols, function(x) colMeans(x[datacols]))





















  

  
