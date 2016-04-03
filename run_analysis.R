## 



filename <- "getdata-projectfiles-UCI HAR Dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("getdata-projectfiles-UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels
activityLabels[,2] <- as.character(activityLabels[,2])
activityLabels
features <- read.table("UCI HAR Dataset/features.txt")
features
features[,2] <- as.character(features[,2])
features
# Extract only the data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)
featuresWanted.names


# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
## train

trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
## trainActivities

trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
## trainSubjects

train <- cbind(trainSubjects, trainActivities, train)
## train

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
## test

testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
## testActivities

testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
## testSubjects

test <- cbind(testSubjects, testActivities, test)
## test

# merge datasets and add labels
allData <- rbind(train, test)
## allData
colnames(allData) <- c("Subject", "Activity", featuresWanted.names)
## colnames(allData)


# turn activities & subjects into factors
allData$Activity <- factor(allData$Activity, levels = activityLabels[,1], labels = activityLabels[,2])
## allData$Activity
allData$Subject <- as.factor(allData$Subject)
## allData$Subject

## Install Reshape Package
install.packages("reshape")

## Load Reshape Package
library("reshape")

allData.melted <- melt(allData, id = c("Subject", "Activity"))
allData.melted
allData.mean <- cast(allData.melted, Subject + Activity ~ variable, mean)

write.table(allData.mean, "TidyData.txt", row.names = FALSE, quote = FALSE)
