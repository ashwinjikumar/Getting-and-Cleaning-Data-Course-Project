# created by Ashwin kumar on 23/12/2017
# wrote in windows Rstudio in windows 10 computer.
library(plyr)
library(dplyr)

#--------------------------------------------------------------------------------------------------
#I. Merges the training and the test sets to create one data set.
#--------------------------------------------------------------------------------------------------
#     Reading training and testing datasets from the folders train,test respectively

x_tr_data <- read.table("train/X_train.txt")
y_tr_data <- read.table("train/y_train.txt")
sub_tr_data <- read.table("train/subject_train.txt")

x_te_data <- read.table("test/X_test.txt")
y_te_data <- read.table("test/y_test.txt")
sub_te_data <- read.table("test/subject_test.txt")

#creating x,y and 'subject' datasets
x_data <- rbind(x_tr_data, x_te_data)
y_data <- rbind(y_tr_data, y_te_data)
sub_data <- rbind(sub_tr_data, sub_te_data)

#--------------------------------------------------------------------------------------------------
# II. Extract only the measurements on the mean and standard deviation for each measurement
#--------------------------------------------------------------------------------------------------

features <- read.table("features.txt")

# columns with mean() or std() in its name
mean_n_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subseting columns
x_data <- x_data[, mean_n_std_features]

# correcting the column names
names(x_data) <- features[mean_n_std_features, 2]

#--------------------------------------------------------------------------------------------------
# III.Use descriptive activity names to name the activities in the data set
#--------------------------------------------------------------------------------------------------

activities <- read.table("activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]

# correcting the column name
names(y_data) <- "activity"

#--------------------------------------------------------------------------------------------------
# IV.Appropriately label the data set with descriptive variable names
#--------------------------------------------------------------------------------------------------

# correct column name
names(sub_data) <- "subject"

# combining in to single data set
all_data <- cbind(x_data, y_data, sub_data)

#--------------------------------------------------------------------------------------------------
# V.Create a second, independent tidy data set with the average of each variable for each activity and each subject
#--------------------------------------------------------------------------------------------------

# 66 <- 68 columns but last two (activity & subject)
mean_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(mean_data, "mean_data.txt", row.name=FALSE)

