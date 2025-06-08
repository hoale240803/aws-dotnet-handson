Create an Object Lifecycle Policy for Amazon S3 Documents

# Scenario

In this challenge, you will change the storage class on files manually. Then you will setup a lifecycle policy to automatically maintain log files. The files will first be moved into S3 IA after 30 days, then to Glacier after 60 days, then deleted after one year.

# Steps

## Create a s3 bucket

![alt text](image.png)

## Update a file

![alt text](image-1.png)

## Change the storage class to standard IA

![alt text](image-2.png)

![alt text](image-3.png)

## Change the storage class to Glacier Instant Retrieval

![alt text](image-4.png)

## Manual deleting the file

![alt text](image-5.png)

## Configure lifecycle rule

![alt text](image-6.png)

## Review

![alt text](image-7.png)

# Summary

Congratulations, you have completed the Create an Object Lifecycle Policy for Amazon S3 Documents Challenge Lab.

You have accomplished the following:

Created a new S3 bucket for log files.

Created an S3 lifecycle rule to move files to the Standard-IA storage class after 30 days, move them to the Glacier

storage class after 60 days, and permanently delete them after 365 days.
