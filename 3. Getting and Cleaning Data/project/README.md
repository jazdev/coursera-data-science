Getting And Cleaning Data Course Project
===================================

### Introduction

This repository is holds the R code for the assignment of the Coursera Data Science Specialization track's "Getting and Cleaning Data" course.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Data Set

The data set "Human Activity Recognition Using Smartphones" has been taken from [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Analysis Procedure

The dataset needs to be downloaded before running the scripts in this repository. Download the dataset and place it in the `UCI HAR Dataset/` directory.

For successful execution, your directory structure must match the structure shown below:

```
your-working-dir/
 |
 |-UCI HAR Dataset/
 |  |-test/
 |  |-train/
 |  |-activity_labels.txt
 |  |-features.txt
 | 
 |-run_analysis.R 

```

The [`CodeBook.md`](https://github.com/jazdev/GettingAndCleaningDataCourseProject/blob/master/CodeBook.md) describes everything about the process that has been performed to clean up the data.

The `run_analysis.R` is the main script that performs the transformation. It can be loaded in R/Rstudio and executed without any parameters.

After successful execution of the script, the results are stored in the `subject_activity_means.txt` file in the `tidy data` directory.
