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
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

###variable
The variable field consists of 66 distinct values defined as:
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
