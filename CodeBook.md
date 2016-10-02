### Transformations applied to the original data to get the output dataset 

  The code assumes the unzipped folder with the Samsung data is already 
  in the working directory
  Commented lines are offered in case the data needs to be downloaded 
  and unzipped first 
  Find the name of the files containing the subjects corresponding to 
  the rows in the data files 
  Finding the file with the list of features in the unzipped folder 
  structure and read the file into "features" 
  Read and combine train and test data in a single data frame 
  Read and combine the corresponding lists of train and test subjects 
  Add the subjects data as a new column to the measurements data frame
  Set the column names with the corresponding features
  From the main data frame, eliminate all the data for the columns 
  that are not about mean or standard deviation
  Generate a new data frame with the averages by column and grouped 
  by subject
  Save the data into the "meansBySubject.txt" file, in the working 
  directory

### Original instructions for data transformations

  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation 
  for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names.
  From the data set in step 4, creates a second, independent tidy data set 
  with the average of each variable for each activity and each subject.
  
### Description of data measurements and calculations

  The only set of variables included from the original list: 
    mean(): Mean value
    std(): Standard deviation
    
  for each measurement below ('-XYZ' is used to denote 3-axial signals 
  in the X, Y and Z directions):
  
  TIME based
    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    
  FREQUENCY based (FFT)
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
    
  The final dataset contains the average values for all the values in each
  column, grouped by subject. 
  by subject
    