# Step 1. Merges the training and the test sets to create one data set.

# activity_labels.txt; dim 6 x 2


# read in the Test set as x_test; dim 2947 x 561
x_test <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt")

# read in the Test Labels as y_test; dim 2947 x 1
y_test <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")

# read in Test Subject identifiers as subject_test (range 1:30); dim 2947 x 1
subject_test <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")

# read in the Train set as x_train; dim 7352 x 561
x_train <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")

# read in the Train Labels as y_train; dim 7352 x 1
y_train <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")

# read in Train Subject identifiers as subject_train (range 1:30); dim 7352 x 1
subject_train <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")

# dim 10299 x 561
x_complete <- rbind(x_test, x_train)

# dim 10299 x 1
y_complete <- rbind(y_test, y_train)

# dim 10299 x 1
subject_complete <- rbind(subject_test, subject_train)

# rename the name attribute of subject_complete to more descriptive term: "subject"
names(subject_complete) <- "subject"

# Step 2. Extracts only the measurements on the mean and standard deviation for
# each measurement. 
# Will likely use some partial matching on "mean" and "std" in features.txt

# read in Features features.txt; dim 561, 2
features <- read.table("./UCI\ HAR\ Dataset/features.txt")

#assign just the feature label values to labels
labels <- as.character(features[,2])

# match for mean() or std()
boolean_vector <- grep("mean\\(\\)|std\\(\\)", labels)

# subset x_complete; dim 10299 x 66
x_subset <- x_complete[boolean_vector]

# subset feature label list since we'll need this later dim: 66
labels_subset <- labels[boolean_vector]


## Step. 3 Use descriptive activity names to name the activities in the data set
## Need to replace numbers with the activity labels in activity_labels.txt

y_complete$V1[y_complete$V1 == 1] <- "WALKING"
y_complete$V1[y_complete$V1 == 2] <- "WALKING_UPSTAIRS"
y_complete$V1[y_complete$V1 == 3] <- "WALKING_DOWNSTAIRS"
y_complete$V1[y_complete$V1 == 4] <- "SITTING"
y_complete$V1[y_complete$V1 == 5] <- "STANDING"
y_complete$V1[y_complete$V1 == 6] <- "LAYING"

# rename the name attribute of y_complete to more descriptive term: "activities"
names(y_complete) <- "activities"


## Step 4: Appropriately labels the data set with descriptive variable names. 
## rename each variable name to a more descriptive variable name- thats it

# clean up labels_subset
cleaned_labels_subset <- gsub("std","standarddeviation",labels_subset)
cleaned_labels_subset <- gsub("Acc","acceleration",cleaned_labels_subset)
cleaned_labels_subset <- gsub("[\\(\\)-]","",cleaned_labels_subset)
cleaned_labels_subset <- gsub("BodyBody","Body",cleaned_labels_subset)
cleaned_labels_subset <- gsub("tBody","timebody",cleaned_labels_subset)
cleaned_labels_subset <- gsub("tGravity","timegravity",cleaned_labels_subset)
cleaned_labels_subset <- gsub("fBody","frequencybody",cleaned_labels_subset)
cleaned_labels_subset <- gsub("fGravity","frequencygravity",cleaned_labels_subset)
cleaned_labels_subset <- tolower(cleaned_labels_subset)


## this clean-up is not quite done, but good enough for now.

# rename the names attributes in x_complete to more descriptive terms from labels
names(x_subset) <- cleaned_labels_subset

## Step 5: From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

## First let's construct the data set from steps 1 through 4

total_clean <- cbind(y_complete, x_subset)
total_clean$activities <- as.factor(total_clean$activities)

total_clean <- cbind(subject_complete, total_clean)

# load reshape2
library(dplyr)

by_subject <- total_clean%>% group_by(subject, activities)
tidy_ds2 <- by_subject %>% summarise_each(funs(mean))

## write the file
write.table(tidy_ds2, file = "course_project.txt", row.names = TRUE)
