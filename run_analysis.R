## Load the data files
 # load global files
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
 #load train files
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
 #merge train datasets in one file (subject_id,activity_id,set)
train <- cbind(subjectTrain, yTrain, xTrain)
#load test files
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
#merge test datasets in one file (subject_id,activity_id,set)
test <- cbind(subjectTest, yTest, xTest)

## Merges the training and the test sets to create one data set. --> 1st rows train
totalDataSet <- rbind(train, test)

## Extracts only the measurements on the mean and standard deviation for each measurement.
meanAndStd <- grep(".*mean.*|.*std.*", features[,2])
meanAndStd_adjust <- c(c(1,2), (meanAndStd+2))
finalDataSet <- totalDataSet[ ,meanAndStd_adjust]
features[,2] <- as.character(features[,2])
featuresLabels <- features[meanAndStd,2]

## Uses descriptive activity names to name the activities in the data set
finalDataSet[ ,2] <- factor(finalDataSet$V1.1, labels = activityLabels$V2)
            
## Appropriately labels the data set with descriptive variable names.
colnames(finalDataSet) <- c("Subject id", "Activity", featuresLabels)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
allSubjects <- matrix(, nrow = 0, ncol = 80)
for (j in 1:30) {
  allFeatures <- matrix(, nrow = 6, ncol = 0)
  oneSubject <- finalDataSet[finalDataSet$`Subject id`==j,]
  for (i in 3:ncol(finalDataSet)) {
    oneFeature <- tapply(oneSubject[,i], oneSubject$Activity, mean)
    oneFeature <- as.data.frame(oneFeature)
    allFeatures <- cbind(allFeatures, oneFeature)
  }
  allFeatures <- cbind(rep(j,6), activityLabels$V2, allFeatures)
  allSubjects <- rbind(allSubjects, allFeatures)
}
colnames(allSubjects) <- c("Subject id", "Activity", featuresLabels)

write.table(allSubjects, file = "tidyDataSet.txt", row.name=FALSE)


