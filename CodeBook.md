Getting-and-Cleaning-Data
=========================

CodeBook for Getting and Cleaning Data Project

Go back to quiz 1 and look at the codebook there for inspiration  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf


Codebook:
The dog's name was transformed into an IDNumber (unique) (1-50),
the address was transformed into a factor, OwnerName (levels Alice, Bob, Charlie, Deborah, Ernest and Fred),
time and date walked were counted to make WalksPerWeek1, WalksPerWeek2, and WalksPerWeek3. Week1 begins at 00:01UTC on July1, 2014, Week2 begins at 00:01UTC on July8, 2014, Week3 begins at 00:01UTC on July15, 2014.
Health was summarized as HealthWeek1, HealthWeek2, and HealthWeek3. It is a factor with two levels, Well and Sick. If the dog was sick at any walk during that week, dog was marked sick, else dog was marked well.
Comments are dropped.
Pay is transformed into PayWeek1, PayWeek2, PayWeek3, which is a factor that has two levels (Yes, and No) for correct pay paid during that week.
Dog size is a factor with levels Small, Medium and Large

Codebook:

4 columns
The subject fields were unmodified and indicated which of the 30 subjects ( identified by id 1-30) the observation applies.
The activity was transformed from an id (1-6) to the text values of {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING
The variable field consists of 66 distinct values defined as:
"body_acc_mean_X_time", "body_acc_mean_Y_time", "body_acc_mean_Z_time",
                        "body_acc_std_X_time", "body_acc_std_Y_time", "body_acc_std_Z_time",
                        "gravity_acc_mean_X_time", "gravity_acc_mean_Y_time","gravity_acc_mean_Z_time",
                        "gravity_acc_std_X_time","gravity_acc_std_Y_time", "gravity_acc_std_Z_time",
                        "body_acc_jerk_mean_X_time","body_acc_jerk_mean_Y_time","body_acc_jerk_mean_Z_time",
                        "body_acc_jerk_std_X_time","body_acc_jerk_std_Y_time","body_acc_jerk_std_Z_time",
                        "body_gyro_mean_X_time","body_gyro_mean_Y_time","body_gyro_mean_Z_time",
                        "body_gyro_std_X_time","body_gyro_std_Y_time","body_gyro_std_Z_time",
                        "body_acc_jerk_mean_X_time","body_acc_jerk_mean_Y_time","body_acc_jerk_mean_Z_time",
                        "body_acc_jerk_std_X_time","body_acc_jerk_std_Y_time","body_acc_jerk_std_Z_time",
                        "body_acc_mean_time","body_acc_std_time",
                        "gravity_acc_mag_mean_time","gravity_acc_mag_std_time",
                        "body_acc_jerk_mag_mean_time","body_acc_jerk_mag_std_time",
                        "body_gyro_mag_mean_time","body_gyro_mag_std_time",
                        "body_gyro_jerk_mag_mean_time", "body_gyro_jerk_mag_std_time",
                        "body_acc_mean_X_freq","body_acc_mean_Y_freq","body_acc_mean_Z_freq",
                        "body_acc_std_X_freq", "body_acc_std_Y_freq","body_acc_std_Z_freq",
                        "body_acc_jerk_mean_X_freq","body_acc_jerk_mean_Y_freq","body_acc_jerk_mean_Z_freq",
                        "body_acc_jerk_std_X_freq","body_acc_jerk_std_Y_freq","body_acc_jerk_std_Z_freq",
                        "body_gyro_mean_X_freq","body_gyro_mean_Y_freq","body_gyro_mean_Z_freq",
                        "body_gyro_std_X_freq","body_gyro_std_Y_freq","body_gyro_std_Z_freq",
                        "body_acc_mag_mean_freq","body_acc_mag_std_freq",
                        "body_acc_jerk_mag_mean_freq","body_acc_jerk_mag_std_freq",
                        "body_gyro_mag_mean_freq","body_gyro_mag_std_freq",
                        "body_gyro_jerk_mag_mean_freq", "body_gyro_jerk_mag_std_freq"