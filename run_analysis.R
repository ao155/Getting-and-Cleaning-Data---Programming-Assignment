# download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# unzip the downloaded file and move the folder "UNI HAR Dataset" into your working directory

# compose the test data set by adding the activity codes and subject IDs to the measurements table
Test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/Subject_test.txt")
Test$label <- Y_test$V1
Test$subject <- Subject_test$V1

#compose the traing data set by adding the activity codes and subject IDs to the measurements table
Train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/Subject_train.txt")
Train$label <- Y_train$V1
Train$subject <- Subject_train$V1

# append test and train data sets
All <- rbind.data.frame(Train, Test)
All$subject = as.factor(All$subject)

# subset the merged data set to keep only measurements with "mean" or "std"
Feat <- read.table("./UCI HAR Dataset/Features.txt")
Feat$V2 <- as.character(Feat$V2)
Feat$V3 <- ifelse ((grepl("mean",Feat$V2) | grepl("std",Feat$V2)), TRUE, FALSE)
All_sub <- All[,Feat$V3]

# load the activity labels data set and rename the column with the labels to "Activity" using the plyr package
library(plyr)
Activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
Activity <- rename(Activity, c("V2"="activity"))

# add the activity labels to the main data set and remove the activity codes
All_sub <-merge.data.frame(All_sub, Activity, by.x="label", by.y="V1")
All_sub$label = NULL

# rename the columns in the main data set to include feature descriptions
Feat_names1 <- Feat$V2[Feat$V3]
Feat_names2 <- c("subject", "activity")
Feat_names <- append(Feat_names1, Feat_names2)
colnames(All_sub) <- Feat_names

# create a data set with the average of each variable for each activity and each subject from the main data set
All_sub_avg <- aggregate(All_sub[,1:79], list(All_sub$activity, All_sub$subject), mean)
All_sub_avg <- rename(All_sub_avg, c("Group.1"="Activity", "Group.2"="Subject"))

# write last data set into a text file
file_path <- "./UCI HAR Dataset/MyOutputData.txt"
write.table(All_sub_avg, file = file_path, row.name=FALSE)
