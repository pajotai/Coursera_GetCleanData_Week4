#  This file contains the R instructions for tidying up the data for the week4 assignment of the "Getting and Cleaning Data" course
#  The code assumes the unzipped folder with the Samsung data is already in the working directory
#  The output is the "meansBySubject.txt" file saved into the working directory

#  The next two commented lines are left here just in case the data needs to be downloaded and unzipped first 
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
# files <- unzip("dataset.zip")

#  Generically find the files with data, using the pattern for the actual test and train files, instead of hardcoding the file names
#  The codes works both when the entire folder structure from the zip file is present and when only the two train/test text files are present
datafiles <- grep("/X_.*.txt$", files, value = TRUE)

#  Find the name of the files containing the subjects corresponding to the rows in the data files 
subjectfiles <- grep("/subject_.*.txt$", files, value = TRUE)

#  Finding the file with the list of features in the unzipped folder structure and read the file into "features" 
featuresfile <- grep("/features.txt$", files, value = TRUE)
features <- read.table(featuresfile)

#  Read and combine train and test data in a single data frame 
mydata <- do.call("rbind", lapply(datafiles, function(fn) 
  data.frame(read.table(fn)
  )))

#  Read and combine the corresponding lists of train and test subjects 
mysubjects <- do.call("rbind", lapply(subjectfiles, function(fn) 
  data.frame(read.table(fn)
  )))

#  Add the subjects data as a new column to the measurements data frame
mydata <- data.frame(mysubjects, mydata)

#  Set the column names with the corresponding features
colnames(mydata) <- c("subject", as.vector(features$V2))

#  From the main data frame, eliminate all the data for the columns that are not about mean or standard deviation
mydata <- mydata[c("subject", grep("(mean|std)", names(mydata), value = TRUE))]

#  Generate a new data frame with the averages by column and grouped by subject
meansBySubject <- aggregate(mydata[ ,2:ncol(mydata)], list(subject = mydata$subject), mean)

#  Save the data into the "meansBySubject.txt" file
write.table(meansBySubject, "meansBySubject.txt", row.names = FALSE)