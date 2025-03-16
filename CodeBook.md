---
title: "CodeBook"
output: pdf_document
date: "2025-03-16"
---

# CodeBook for the Tidy Data Set

## Overview
This CodeBook describes the dataset created for the "Getting and Cleaning Data" course project. The dataset is derived from the "Human Activity Recognition Using Smartphones" dataset.

## Variables
- `Subject`: The ID of the subject who performed the activity (1-30).
- `Activity`: The name of the activity performed.
- `TimeBodyAccelerometer-Mean-X`: The mean of the body acceleration signal in the X direction.
- `TimeBodyAccelerometer-Mean-Y`: The mean of the body acceleration signal in the Y direction.
- `TimeBodyAccelerometer-Mean-Z`: The mean of the body acceleration signal in the Z direction.
- ... (Other mean and standard deviation variables follow)

## Transformations
1. Merged training and test datasets.
2. Extracted only mean and standard deviation measurements.
3. Used descriptive activity names instead of numeric labels.
4. Renamed variables to be more readable.
5. Created a second tidy dataset with the average of each variable for each activity and each subject.

