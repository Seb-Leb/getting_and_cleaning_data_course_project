===================================================================================================
Coursera Getting and Cleaning Data - Course Project                                      2016-04-23
===================================================================================================
Sebastien Leblanc                                                                       seb@leb.cat

This analysis was conducted on accelerometer triaxial acceleration and gyroscope angular velocity data pulished by Anguita D. (2013) [1]. The data was aquired from a Samsung smartphone worn by 30 volunteers while performing various activities.

Variables & Data: 
=========================================
The output data set contains:
- A subject identifier
- labled activity identifiers
- The mean of 86 feature variables (themselves mean and standard deviation values of accelerometer and gyroscope data) computed by subject & activity

Transformations of the data:
=========================================
First, the training and test data sets where agreggated along with the labels for the subjects and activities. Then the variables where named using the feature labels provided in the original data set. Then the columns containing the mean and standard deviation of each variable were extracted. Lastly, the data was grouped by subject and activity to finally extract the mean of each varibale. The resulting data frame was output to a txt file.
The README.md file describes the functions in the R script used to execute the transformations.

Reference:
==========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
