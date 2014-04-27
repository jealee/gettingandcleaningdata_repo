CodeBook.md
==================

# Data 
The data for this analysis was collected from accelerometers from the Samsung Galaxy S II smartphone. Thirty volunteers performed six different physical activities with the smartphone attached to their waist. A training data set was obtained from 70\% of the volunteers, while the test data was compared against 30\% of the data. The measurements in this data set include various signals, such as the triaxial acceleration, the estimated body acceleration, and the triangular angular velocity. 

# Variables 
subjTest and subjTrain: data frames with each row identifying a subject who performed the activity 
yTest and yTrain: data frames with each row identifying the activity performed 
xTest and xTrain: data frames with each row matching a specific observation for a given subject and activity and each column indicating a different analytical measurement 
full_data: data frame with the merged data from the testing and training set 
features:  lists each analytical measurement
featuresIndices: list that subsets only features that indicate the mean and standard deviation for a given measurement 
activityLabels: data frame that shows that maps each activity index to the activity type 
tidyDT: the output data frame that shows the merged data with correct column and variable names; also shows the average for each specific observation type

# Data processing contained in the script 
The script first reads in the data, assigning appropriate column names as it reads in the text file. 

The script then subsets the feature variables to only extract the mean and standard deviation for each measurement. 

By merging the training and test data sets, the script creates a full_data set. Finally, the script outputs a tidy data set, which averages each measurement for the thirty subjects over six different physical activities. 