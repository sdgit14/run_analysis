## CodeBook.md

### Data Processing
1. The data set is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ). 

2. Documentation is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

3. Download the zip file using download.file function and unzip the file.

4. The data files are whitespace delimited files. They are read using read.table function.

5. The data set has the following files:
  - activity_labels.txt: This file contains the labels for various activities.
  - features.txt: This file contains the labels for the various features.
  - subject_train.txt: Identifies the subjects for Training data set.
  - y_train.txt: Acitivity identifier for training data set.
  - X_train.txt: Feature vector for training data set.
  - subject_test.txt: Identifies the subjects for test data set.
  - y_test.txt: Acitivity identifier for test data set.
  - X_test.txt: Feature vector for test data set.
6. Training and test data sets are first merged:
  - X_train and X_test are merged using rbind.
  - y_train and y_test are merged using rbind.
  - subject_train and subject_test are merged using rbind.

7. Assign colnames to merged X using features

8. Assign colnames to merged y using activity labels.

9. Extract required columns from X using grep into data. Grep for mean|std to get the required columns.

10. Merge data, y, and subject.

11. Summarise the data using summarise_each function and grouping by Activity label and Subject id. Apply the function mean to each column in the data frame.

12. Write the output to tidy.txt using write.table.

### Variables
**Information from the documentation [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)**

#### Description of Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#### Attributes in the dataset:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.