Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data project

Don't just make a tidy data set, make it clear to people reviewing it why it is tidy. When you given the variables descriptive names, explain why the names are descriptive. Don't give your reviewers the opportunity to be confused about your work, spell it out to them.

A person wanting to make life easy for their marker would give the code for reading the file back into R in the readMe

cite the thread https://class.coursera.org/getdata-016/forum/thread?thread_id=50
------------------------------------------
The original columns were renamed to more readable names.  These column names are used as variable values in the tidy data.

'acc' in the label indicates the data source is the accelerometer 3-axial raw signals tAcc-XYZ,
'gyro' in the label indicates th data souce is the gyroscope 3-axial raw signals tGyro-XYZ.

'time' in the label indicates it is a time domain signal captured at a constant rate of 50 Hz
'freq' in the label indicates it is a frequency domain signal resulting from applying a Fast Fourier Transform (FFT) to some of the signals.

'mean' in the label indicates the values are a mean() calculation
'std' in the label indicates the values are a std() calculcation

'mag' in the label indicated the values represent magnitude of the three-dimensional signals calculated using the Euclidean norm

'X', 'Y' or 'Z' in the label indicate the 3-axial signals in the specified direction.

New labels:
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