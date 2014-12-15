Getting-and-Cleaning-Data
=========================

CodeBook for Getting and Cleaning Data Project

Go back to quiz 1 and look at the codebook there for inspiration  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf


Codebook:
Resulting tidy data consists of 4 columns
###subject
The subject fields were unmodified and indicated which of the 30 subjects ( identified by id 1-30) the observation applies.

###activity
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
3. 'time' in the label indicates it is a time domain signal captured at a constant rate of 50 Hz
4. 'freq' in the label indicates it is a frequency domain signal resulting from applying a Fast Fourier Transform (FFT) to some of the signals.
5. 'mean' in the label indicates the values are a mean() calculation
6. 'std' in the label indicates the values are a std() calculcation
7. 'mag' in the label indicated the values represent magnitude of the three-dimensional signals calculated using the Euclidean norm
8. 'X', 'Y' or 'Z' in the label indicate the 3-axial signals in the specified direction.

The variable field consists of 66 distinct values:
- body_acc_mean_X_time
- body_acc_mean_Y_time
- body_acc_mean_Z_time
- body_acc_std_X_time
- body_acc_std_Y_time
- body_acc_std_Z_time
- gravity_acc_mean_X_time
- gravity_acc_mean_Y_time
- gravity_acc_mean_Z_time
- gravity_acc_std_X_time
- gravity_acc_std_Y_time
- gravity_acc_std_Z_time
- body_acc_jerk_mean_X_time
- body_acc_jerk_mean_Y_time
- body_acc_jerk_mean_Z_time
- body_acc_jerk_std_X_time
- body_acc_jerk_std_Y_time
- body_acc_jerk_std_Z_time
- body_gyro_mean_X_time
- body_gyro_mean_Y_time
- body_gyro_mean_Z_time
- body_gyro_std_X_time
- body_gyro_std_Y_time
- body_gyro_std_Z_time
- body_acc_jerk_mean_X_time
- body_acc_jerk_mean_Y_time
- body_acc_jerk_mean_Z_time
- body_acc_jerk_std_X_time
- body_acc_jerk_std_Y_time
- body_acc_jerk_std_Z_time
- body_acc_mean_time
- body_acc_std_time
- gravity_acc_mag_mean_time
- gravity_acc_mag_std_time
- body_acc_jerk_mag_mean_time
- body_acc_jerk_mag_std_time
- body_gyro_mag_mean_time
- body_gyro_mag_std_time
- "body_gyro_jerk_mag_mean_time
- "body_gyro_jerk_mag_std_time
- body_acc_mean_X_freq
- body_acc_mean_Y_freq
- body_acc_mean_Z_freq
- body_acc_std_X_freq
- body_acc_std_Y_freq
- body_acc_std_Z_freq
- body_acc_jerk_mean_X_freq
- body_acc_jerk_mean_Y_freq
- body_acc_jerk_mean_Z_freq
- body_acc_jerk_std_X_freq
- body_acc_jerk_std_Y_freq
- body_acc_jerk_std_Z_freq
- body_gyro_mean_X_freq
- body_gyro_mean_Y_freq
- body_gyro_mean_Z_freq
- body_gyro_std_X_freq
- body_gyro_std_Y_freq
- body_gyro_std_Z_freq
- body_acc_mag_mean_freq
- body_acc_mag_std_freq
- body_acc_jerk_mag_mean_freq
- body_acc_jerk_mag_std_freq
- body_gyro_mag_mean_freq
- body_gyro_mag_std_freq
- body_gyro_jerk_mag_mean_freq
- body_gyro_jerk_mag_std_freq

###average
The average of the variable for the specified subject and activity.
