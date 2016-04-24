===================================================================================================
Coursera Getting and Cleaning Data - Course Project                                      2016-04-23
===================================================================================================
Sebastien Leblanc                                                                       seb@leb.cat

This analysis was conducted on accelerometer data pulished by Anguita D. (2013) [1].

Functions & data transformations:
=========================================
The data transformations where grouped in three functions:

- assemble_dataset() : agregates data from the source data set
    input: a string containing the name of the folder with the source data
    output: a data set with names columns, subject & activity identifier and 86 mean and standard deviation values

- get_means() : groups data by subject and activity and computes the mean of all other input variables
    input: a tidy data frame output by the assemble_dataset() function
    output: a tidy data set showing mean values of all dependent variable per subject and activity

- tidy_data_txt() : writes the input data frame to a txt file
    input: a tidy data frame output by the get_means() function and a filename string
    output: a txt file containing the data frame output by get_means() in the working directory with privided filename
    
The final output was obtained by running the following commands in the R console at a working directory containing the original data set:
    
    source('run_analysis.R')
    tidy_data_txt(get_means(assemble_dataset('UCI HAR Dataset')), 'tidy_data_means')


The dataset includes the following files:
=========================================
- '/UCI HAR Dataset' : the original data published
- '/run_analysis.R' : the R script used to produce the analysis
- '/tidy_data_means.txt' : the tidy data set output of the R script 


