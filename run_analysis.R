library(dplyr)

# Set working directory
setwd("C:/coursera/Getting and Cleaning Data/Project")
# Download the file from the Url
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dFile = "getdata-projectfiles-UCI HAR Dataset.zip"
download.file(fileUrl, dFile)
# Unzip the file
unzip(dFile)
# Set Working drectory to UCI HAR Dataset
setwd("C:/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset")

# Read Activity labels
activity <- read.table("activity_labels.txt",
                       col.names = c("ActivityId", "ActivityNm"))

# Read Feature labels
features <- read.table("features.txt",
                       col.names = c("FeatureId", "FeatureNm"))

# Read subjects
test_subject <- read.table("test/subject_test.txt",
                           col.names = c("SubjectId")
  )
train_subject <- read.table("train/subject_train.txt", 
                            col.names = c("SubjectId")
)
# Merge subjects - train and then test
subject <- rbind(train_subject, test_subject)

# Read y
test_y <- read.table("test/y_test.txt",
                     col.names = c("ActivityId")
)
train_y <- read.table("train/y_train.txt", 
                      col.names = c("ActivityId")
)
# Merge y
all_y <- rbind(train_y, test_y)
y <- inner_join(activity, all_y, by = "ActivityId")

# Read X
test_x <- read.table("test/X_test.txt")
train_x <- read.table("train/X_train.txt")
x <- rbind(train_x, test_x)
colnames(x) <- features[, 2]

# Extract only the required columns - mean and std
data <- x[, grep("mean|std", colnames(x))]

# Column Bind Data, subject and Activity
data <- cbind(data, subject, y)

# Compute average for all measures for each group of Activity and subject 
avg_data <- summarise_each(
  group_by(data, ActivityNm, SubjectId), funs(mean)
  )

# Write the data to a file with col headers and a white space as sep
write.table(avg_data, "../tidy.txt", row.names = FALSE)
