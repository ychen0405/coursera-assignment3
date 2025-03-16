### Assignment 3 ###

library(dplyr)

# Load datasets
activity_labels <- read.table("data/activity_labels.txt", col.names=c("ID","Activity"))
features <- read.table("data/features.txt", col.names=c("Index","Feature"))

# Extract only mean and standard deviation features
target_features <- grep("-(mean|std)\\(\\)", features$Feature)
target_features_names <- features$Feature[target_features]

# Load the training data
train_x <- read.table("data/train/X_train.txt") [, target_features]
train_y <- read.table("data/train/y_train.txt", col.names = "ActivityID")
train_subject <- read.table("data/train/subject_train.txt", col.names = "Subject")

# Load the testing data
test_x <- read.table("data/test/X_test.txt") [ , target_features]
test_y <- read.table("data/test/y_test.txt", col.names = "ActivityID")
test_subject <- read.table("data/test/subject_test.txt", col.names = "Subject")

# Merge training and test datasets
train_data <- cbind(train_subject, train_y, train_x)
test_data <- cbind(test_subject, test_y, test_x)
merged_data <- rbind(train_data, test_data)

# Assign column names
colnames(merged_data) <- c("Subject", "ActivityID", target_features_names)

# Use descriptive activity names
merged_data <- merge(merged_data, activity_labels, by.x = "ActivityID", by.y = "ID", all.x = TRUE)
merged_data <- merged_data[, c(2, ncol(merged_data), 3:(ncol(merged_data) - 1))]  # Reorder columns

# Clean variable names
colnames(merged_data) <- gsub("^t", "Time", colnames(merged_data))
colnames(merged_data) <- gsub("^f", "Frequency", colnames(merged_data))
colnames(merged_data) <- gsub("Acc", "Accelerometer", colnames(merged_data))
colnames(merged_data) <- gsub("Gyro", "Gyroscope", colnames(merged_data))
colnames(merged_data) <- gsub("Mag", "Magnitude", colnames(merged_data))
colnames(merged_data) <- gsub("BodyBody", "Body", colnames(merged_data))

# Create independent tidy dataset with average of each variable for each activity and each subject
run_analysis.R <- merged_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Save the tidy dataset
write.table(run_analysis.R, "tidy_data.txt", row.name = FALSE)

