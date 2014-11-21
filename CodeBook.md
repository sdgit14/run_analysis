## CodeBook.md

run_analysis.R has the following steps:

### Data Processing:
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