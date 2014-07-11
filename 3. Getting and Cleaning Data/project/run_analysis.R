library(reshape2)


## Read all data tables.
## Assuming that all data is in a folder "UCI HAR Dataset" 
## in the currect working directory.

feature_names <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)

train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)



## Combine the train and test tables into one table

train <- cbind(train, train_subj, train_labels)
test <- cbind(test, test_subj, test_labels)
data <- rbind(train, test)



## Create descriptive variable names for the combined data

feature_names <- append(as.vector(feature_names[,2]), c("subject", "activity"))
feature_names <- gsub("\\(\\)", "", feature_names)
feature_names <- gsub("[-,\\,]", ".", feature_names)
feature_names <- gsub("\\(", ".", feature_names)
feature_names <- gsub("\\)", "", feature_names)
names(data) <- feature_names



## Create descriptive activity names for the combined data

data$activity <- factor(data$activity, labels=as.vector(activity_labels[,2]))



## Extract the features related to mean and standard deviation

columns <- append(grep("mean", names(data), value=TRUE), grep("std", names(data), value=TRUE))
dataset <- data[, c(columns, "subject", "activity")]



## Find average of each variable for each activity and each subject

dataset.long <- melt(dataset, id=c("subject", "activity"))
subject_activity.mean <- dcast(dataset.long, subject + activity ~ variable, mean)



## Write the means to a file on disk

dir.create("tidy data", showWarnings=FALSE)
write.csv(subject_activity.mean, file="tidy data/subject_activity_means.txt", row.names=FALSE)
