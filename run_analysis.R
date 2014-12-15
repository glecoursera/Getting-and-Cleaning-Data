#bind all relevent files (subject, x_data, y_data) into one data frame and assigns relevent column names.
bind_files <- function(subject_file, x_file, y_file) {
  subject_data <- read.table(paste("./UCI HAR Dataset/",subject_file, sep=""), col.names="subject")
  message("subject_data rows: ", dim(subject_data)[1], " subject_data columns: ", dim(subject_data)[2])
  
  x_data <- read.table(paste("./UCI HAR Dataset/",x_file, sep=""), col.names=features[,2])
  message("x_data rows: ", dim(x_data)[1], " x_data columns: ", dim(x_data)[2])
  
  y_data <- read.table(paste("./UCI HAR Dataset/",y_file, sep=""), col.names="activity")
  message("y_data rows: ", dim(y_data)[1], " y_data columns: ", dim(y_data)[2])
  
  merged_data <- cbind(subject_data, y_data, x_data)
  merged_data
}

get_col_names <- function() {
  #get the columns lables based on the features.  Does not include any subject or activity columns.
  all_col_labels <- features[,2,  drop=FALSE]
  
  #using all columns that are direct mean() and std() calcuations.  
  #Other columns include reference to mean and std but they are calculation based 
  #on mean and std and will not be included.
  required_cols <- subset(all_col_labels,  grepl(".*.*-(mean|std)\\(\\).*" , all_col_labels$label) )
  #convert all of the -mean() and -std() into names R will recognize 
  required_col_names <- make.names(required_cols$label)
  #add the subject and activity column names to the beginning of the list.
  required_col_names <- append(required_col_names, c("subject", "activity"), after=0)
  required_col_names
}
 
assign_activity_label <- function(required_data) {
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.name=c("activity", "act_label"))  
  required_data_with_activity_label_added <- merge(required_data,activity_labels)
  message("with_label: ", dim(required_data_with_activity_label_added)[1], " with_label: ", dim(required_data_with_activity_label_added)[2])
  required_data_with_activity_label_added
}

#applying these column names after the merge, therefor the common original column of 'activity' has been reordered and placed first.
renamed_col_names <-  c("activity_id", "subject",
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
                        "body_gyro_jerk_mag_mean_freq", "body_gyro_jerk_mag_std_freq",
                        "activity_label")

to_variables <-  c("body_acc_mean_X_time", "body_acc_mean_Y_time", "body_acc_mean_Z_time",
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
                        "body_gyro_jerk_mag_mean_freq", "body_gyro_jerk_mag_std_freq")


features <- read.table("./UCI HAR Dataset/features.txt", col.names=c("index", "label"))  
message("features rows: ", dim(features)[1], " features columns: ", dim(features)[2])

#merge all the test files together into one data.frame
merged_test <- bind_files("test/subject_test.txt", "test/X_test.txt", "test/y_test.txt")
#merge all the training files together into one data.frame
merged_train <- bind_files("train/subject_train.txt", "train/X_train.txt", "train/y_train.txt")

#bind both data.frames together into one full set.
full_data_set <- rbind(merged_test, merged_train)
message("full_data_set: ", dim(full_data_set)[1], " full_data_set: ", dim(full_data_set)[2])

required_col_names <- get_col_names();
required_data_set <- full_data_set[,required_col_names]
message("required_data_set: ", dim(required_data_set)[1], " required_data_set: ", dim(required_data_set)[2])

required_data_set_with_activity_label <- assign_activity_label(required_data_set)

colnames(required_data_set_with_activity_label) <- renamed_col_names

#write.table(required_data_set_with_activity_label, "./tidy.txt", row.names=FALSE)

#From the data set in step 4, creates a second, 
#independent tidy data set with the average of 
#each variable for each activity and each subject.


#See https://class.coursera.org/getdata-016/forum/thread?thread_id=161 for some valid test data.
melted <- melt(required_data_set_with_activity_label, id=c("subject", "activity_label" ), measure.vars=to_variables)

dcasted <- dcast(melted,  subject+activity_label ~ variable, mean)

melted2 <- melt(dcasted, id=c( "subject", "activity_label"), measure.vars=to_variables)

ordered <- melted2[order(melted2$subject, melted2$activity_label),]

#need to write output to file.
