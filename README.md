# Assignment: Getting and Cleaning Data Course Project
This is my course project solution for the Getting and Cleaning Data Coursera course.
It explains how all of the scripts work and how they are connected.

My solution contains the following scripts -

### 1. CodeBook.md
Describes the variables, data and any transformations or work that was used to clean up the data.

### 2. The R script, run_analysis.R, does the following:

1. Downloads the dataset for the project.
2. Load the List of all features (from file "UCI HAR Dataset/features.txt").
3. Load the class labels with their activity name (from file "UCI HAR Dataset/activity_labels.txt").
4. Extract only the data on mean and standard deviation from the features list.
5. Load the Training data set (from file "UCI HAR Dataset/train/X_train.txt") and select only data relating to the the mean and standard deviation features.
6. Load the Training labels dataset (from file "UCI HAR Dataset/train/Y_train.txt")
7. Load subject who performed the activity dataset (from file "UCI HAR Dataset/train/subject_train.txt")
8. Merge the dataset in from Steps 5, 6 and 7 by column using the cbind function.
9. Load the Test data set (from file "UCI HAR Dataset/train/X_test.txt") and select only data relating to the the mean and standard deviation features.
10. Load the Test labels dataset (from file "UCI HAR Dataset/train/Y_test.txt")
11. Load subject(s) who performed the test from file "UCI HAR Dataset/train/subject_test.txt".
12. Merge the dataset in from Steps 9, 10 and 11 by column using the cbind function.
13. Merge Training dataset (from Step 8) and Test dataset (from Step 12) by row using the rbind function and add labels.
14. Store the Training Activities and Subject data in a Factor variable
15. Load the "Reshape" Package
16. Use the melt function from the "Reshape" package to get ensure that each row is a unique "subject" and "activity" combination.
17. Cast the melted data into the required shape - The cast function is in the "Reshape" package
18. Write cleaned up data to file TidyData.txt.


### 3. Result script, TidyData.txt
The end result is shown in the file TidyData.txt.