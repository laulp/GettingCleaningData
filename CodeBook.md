In this work the dataset used was [1]:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

This dataset includes [1]:
The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

---------------------------------------------------------------------------
To clean up the data to achieve a tidy dataset with the average of each activity for each subject (both the train set and the test set), the following steps were performed:
1. Merge the training and the test sets to create one data set.
   - After loading the data files, a train unique set was created combining the 'Subject_id, the activities and the measurements. The same was performed for the test data.
   - Then, both datasets were merged to have only one data set to work with.
2. Extract only the measurements on the mean and standard deviation for each measurement.
   - Using the 'grep' function, it was selected only the measurements on the mean and standard deviation, both in the feature dataset and in the total dataset created in step 1.
3. Uses descriptive activity names to name the activities in the data set.
   - To achieve that, the factor function was used to rename the activities id for the proper names.
4. Appropriately labels the data set with descriptive variable names.
   - Using 'colnames' it was assigned a descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
   - The mean of the measurements was obtained by the tapply function. But only for each subject and measurement.
   - Then, through a For loop, a complete data set was created with the mean value of each measurement for each activity and for each subject.
   

---------------------------------------------------------------------------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012