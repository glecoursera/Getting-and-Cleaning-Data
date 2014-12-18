Getting-and-Cleaning-Data
=========================

The file `run_analysis.R` will take the data downloaded from [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and produce the tidy data set described [here] (https://github.com/glecoursera/Getting-and-Cleaning-Data/blob/master/README.md#resulting-tidy-data-consists-of-4-columns) following these [steps] (https://github.com/glecoursera/Getting-and-Cleaning-Data/blob/master/README.md#step-1).  To load the data into a data.frame use:

```R
load.data(tidy.txt)
```

####Step 1
Each group of files are converted into a single data.frame using cbind.  This is completed for the following files:
`subject_test.txt`, `X_test.txt` and `Y_test.txt` (test data)
`subject_train.txt`, `X_train.txt` and `Y_train.txt` (training data)
This is completed by the function `bind_files`.

####Step 2
The 2 data.frames (test and train) are converted into a single data.frame using rbind.

####Step 3 
The column names containing the text `-std()` and `-mean()` are determined using the function `get_col_name` which uses grep and regex to find the column names.  The column **subject** and **activity** are also included in the list.

####Step 4
The data.frame from Step 2 is then reduced to only the columns deteremined in Step 3 .

####Step 5
The function `assign_activity_label` loads the file `activity_labels.txt` and merges with the data.frame from Step 4.  This adds the column **activity_label** to the data.frame containing one of six values listed below in ['activity_level' description] (https://github.com/glecoursera/Getting-and-Cleaning-Data/blob/master/README.md#activity_label).

####Step 6
The readable column names are constructed from the 'replace_col_names' character vector and the text **activity**, **subject** and **activity_label**.  These updated column names are applied to the data.frame.

####Step 7
The data.frame is melted (using the reshape2 package `melt` function) and converts the data.frame to use **subject** and **activity_label** as ids and the replace_col_names values are assigned as measure.vars.  `dcast` is used to apply the mean function across **subject** and **activity_label** combinations against the variables.  `melt` is applied again to convert the data.frame to long form tidy data.

####Step 8 
The data.frame is ordered by **subject** first, then **activity_label**.

####Step 9
The final tidy data.frame is written to a file `tidy.txt` in the current working directory.

##Resulting Tidy Data Consists of 4 Columns
###subject
The subject fields were unmodified and indicated which of the 30 subjects ( identified by id 1-30) the observation applies.

###activity_label
The activity was transformed from an id (1-6) to the text values of 
- WALKING (1)
- WALKING_UPSTAIRS (2)
- WALKING_DOWNSTAIRS (3)
- SITTING (4)
- STANDING (5)
- LAYING (6)

###variable
The variable field values are defined as:

1. 'acc' in the label indicates the data source is the accelerometer 3-axial raw signals tAcc-XYZ.
2. 'gyro' in the label indicates th data souce is the gyroscope 3-axial raw signals tGyro-XYZ.
3. 't' at the beginning of the label indicates it is a time domain signal captured at a constant rate of 50 Hz
4. 'f' at the beginning of the label indicates it is a frequency domain signal resulting from applying a Fast Fourier Transform (FFT) to some of the signals.
5. 'mean' in the label indicates the values are a mean() calculation
6. 'std' in the label indicates the values are a std() calculcation
7. 'mag' in the label indicated the values represent magnitude of the three-dimensional signals calculated using the Euclidean norm
8. 'X', 'Y' or 'Z' in the label indicate the 3-axial signals in the specified direction.

The variable field consists of 66 distinct values:
- tBodyAcc.meanX
- tBodyAcc.meanY
- tBodyAcc.meanZ
- tBodyAcc.stdX
- tBodyAcc.stdY
- tBodyAcc.stdZ
- tGravityAcc.meanX
- tGravityAcc.meanY
- tGravityAcc.meanZ
- tGravityStd.meanX
- tGravityStd.meanY
- tGravityStd.meanZ
- tBodyAccJerk.meanX
- tBodyAccJerk.meanY
- tBodyAccJerk.meanZ
- tBodyAccJerk.stdX
- tBodyAccJerk.stdY
- tBodyAccJerk.stdZ
- tBodyGyro.meanX
- tBodyGyro.meanY
- tBodyGyro.meanZ
- tBodyGyro.stdX
- tBodyGyro.stdY
- tBodyGyro.stdZ
- tBodyAccJerk.meanX
- tBodyAccJerk.meanY
- tBodyAccJerk.meanZ
- tBodyAccJerk.stdX
- tBodyAccJerk.stdY
- tBodyAccJerk.stdZ
- tBodyAcc.mean
- tBodyAcc.std
- tGravityAccMag.mean
- tGravityAccMag.std
- tBodyAccJerkMag.mean
- tBodyAccJerkMag.std
- tBodyGyroMag.mean
- tBodyGyroMag.std
- tBodyGyroJerkMag.mean
- tBodyGyroJerkMag.std
- fBodyAcc.meanX
- fBodyAcc.meanY
- fBodyAcc.meanZ
- fBodyAcc.stdX
- fBodyAcc.stdY
- fBodyAcc.stfZ
- fBodyAccJerk.meanX
- fBodyAccJerk.meanY
- fBodyAccJerk.meanZ
- fBodyAccJerk.stdX
- fBodyAccJerk.stdY
- fBodyAccJerk.stdZ
- fBodyGyro.meanX
- fBodyGyro.meanY
- fBodyGyro.meanZ
- fBodyGyro.stdX
- fBodyGyro.stdY
- fBodyGyro.stdZ
- fBodyAccMag.mean
- fBodyAccMag.std
- fBodyAccJerkMag.mean
- fBodyAccJerkMag.std
- fBodyGyroMag.mean
- fBodyGyroMag.std
- fBodyGyroJerkMag.mean
- fBodyGyroJerkMag.std

###value
The average of the variable for the specified subject and activity combination.
