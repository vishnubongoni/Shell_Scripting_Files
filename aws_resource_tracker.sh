#!/bin/bash
#
#
#
###########################
#Author: Vishnu
#Date: 19/05/2025
#
#Version:v1.0.0
#
#This file is to view resources in aws
#
#############################


set -x  # To debug

echo "Display all the running Instances"
aws ec2 describe-instances


echo "Display all the buckets"
aws s3 ls


echo "Display all the lambda functions"
aws lambda list-functions

echo "list all the iam users"
aws iam list-users

echo "List all the key-pairs"
aws ec2 describe-key-pairs
