# Reads in the training and test set, assuming that the working directory is set to "/UCI HAR Dataset-2"
subjTest <- read.table("test/subject_test.txt", col.names = "Subject")
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt", col.names = "Activity")
subjTrain <- read.table("train/subject_train.txt", col.names = "Subject")
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt", col.names = "Activity")

# Subset the output variables to only extract the mean and standard deviation for each measurement 
features <- read.table("features.txt")
featuresIndices <- grep("mean\\(\\)|std\\(\\)",features[,2])
xTestModified <- xTest[, featuresIndices]
xTrainModified <- xTrain[, featuresIndices]

# Adds descriptive column names to the measurements 
colnames(xTestModified) <- features[,2][featuresIndices]
colnames(xTrainModified) <- features[,2][featuresIndices]

# Merges the training and the test sets to create one data set
train_merg <- cbind(subjTrain, yTrain, xTrainModified)
test_merg <- cbind(subjTest, yTest, xTestModified)
full_data <- rbind(train_merg, test_merg)

# Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")
activityLabels <- levels(factor(activity[, 2]))
full_data$Activity <- mapvalues(full_data$Activity, from = c(1, 2, 3, 4, 5, 6), to = activityLabels)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidyDT <- full_data[0, ] 
for (i in min(full_data$Subject):max(full_data$Subject)) {
  for (j in 1: length(activityLabels)){
    row = nrow(tidyDT) + 1
    activitySS <- mapvalues(j, from = c(1, 2, 3, 4, 5, 6), to = activityLabels)
    tidyDT[row, ] <- sapply(full_data[full_data$Subject == i & full_data$Activity == activitySS, ], mean )
    tidyDT[row, 2] <- activitySS # re-names the activity column
  }
}

write.table(tidyDT, file="/tidyDT.txt")