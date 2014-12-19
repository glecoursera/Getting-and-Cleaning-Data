library(reshape2)

#Binds all relevent files (subject, x_data, y_data) into one data frame and assigns relevent column names.
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

#Gets all the features containing -mean() or -std() and converts them to R column names.  
#Then adds the subject and activity columns to the beginning of the list.
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

#loads the activity labels and merges with the data (which contains only required columns) resulting
#in a activity text label for each observation
assign_activity_label <- function(required_data) {
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.name=c("activity", "act_label"))  
  required_data_with_activity_label_added <- merge(required_data,activity_labels)
  message("with_label: ", dim(required_data_with_activity_label_added)[1], " with_label: ", dim(required_data_with_activity_label_added)[2])
  required_data_with_activity_label_added
}


#new variable column names
replace_col_names <- c("tBodyAcc.meanX", "tBodyAcc.meanY", "tBodyAcc.meanZ",
                       "tBodyAcc.stdX", "tBodyAcc.stdY", "tBodyAcc.stdZ",
                       "tGravityAcc.meanX", "tGravityAcc.meanY","tGravityAcc.meanZ",
                       "tGravityStd.meanX", "tGravityStd.meanY","tGravityStd.meanZ",
                       "tBodyAccJerk.meanX","tBodyAccJerk.meanY","tBodyAccJerk.meanZ",
                       "tBodyAccJerk.stdX","tBodyAccJerk.stdY","tBodyAccJerk.stdZ",
                       "tBodyGyro.meanX","tBodyGyro.meanY","tBodyGyro.meanZ",
                       "tBodyGyro.stdX","tBodyGyro.stdY","tBodyGyro.stdZ",
                       "tBodyAccJerk.meanX","tBodyAccJerk.meanY","tBodyAccJerk.meanZ",
                       "tBodyAccJerk.stdX","tBodyAccJerk.stdY","tBodyAccJerk.stdZ",
                       "tBodyAcc.mean","tBodyAcc.std",
                       "tGravityAccMag.mean","tGravityAccMag.std",
                       "tBodyAccJerkMag.mean","tBodyAccJerkMag.std",
                       "tBodyGyroMag.mean","tBodyGyroMag.std",
                       "tBodyGyroJerkMag.mean", "tBodyGyroJerkMag.std",
                       "fBodyAcc.meanX","fBodyAcc.meanY","fBodyAcc.meanZ",
                       "fBodyAcc.stdX","fBodyAcc.stdY","fBodyAcc.stfZ",
                       "fBodyAccJerk.meanX","fBodyAccJerk.meanY","fBodyAccJerk.meanZ",
                       "fBodyAccJerk.stdX","fBodyAccJerk.stdY","fBodyAccJerk.stdZ",
                       "fBodyGyro.meanX","fBodyGyro.meanY","fBodyGyro.meanZ",
                       "fBodyGyro.stdX","fBodyGyro.stdY","fBodyGyro.stdZ",
                       "fBodyAccMag.mean","fBodyAccMag.std",
                       "fBodyAccJerkMag.mean","fBodyAccJerkMag.std",
                       "fBodyGyroMag.mean","fBodyGyroMag.std",
                       "fBodyGyroJerkMag.mean", "fBodyGyroJerkMag.std")



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

#build the complete column rename list using the replace_col_names 
renamed_col_names <- append(replace_col_names, c("activity_id", "subject"), after=0)
renamed_col_names <- append(renamed_col_names, "activity_label")

#applying these column names after the merge, therefor the common original column of 'activity' has been reordered and placed first.
colnames(required_data_set_with_activity_label) <- renamed_col_names

#See https://class.coursera.org/getdata-016/forum/thread?thread_id=161 for some valid test data.
#melt the data.frame to convert columns to variables
melted <- melt(required_data_set_with_activity_label, id=c("subject", "activity_label" ), measure.vars=replace_col_names)
#convert into a data.frame by subject+activity_label and calculation the mean for each combination.
dcasted <- dcast(melted,  subject+activity_label ~ variable, mean)
melted2 <- melt(dcasted, id=c( "subject", "activity_label"), measure.vars=replace_col_names)

complete_records <- melted2[complete.cases(melted2),]
#order the data.frame first by subject, then activity_label.
ordered <- complete_records[order(complete_records$subject, complete_records$activity_label),]

write.table(ordered, "./tidy.txt", row.names=FALSE)