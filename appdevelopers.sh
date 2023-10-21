#!/bin/bash

# Define Variables
GROUP_NAME="AppDevelopers"
USER_NAME="nikhil"
PASSWORD="@ppD3veloper2020!"
POLICIES=("AmazonEC2ReadOnlyAccess" "AWSCloud9EnvironmentMember")

# Create IAM Group
aws iam create-group --group-name $GROUP_NAME

# Attach policies to group
for policy in "${POLICIES[@]}"; do
    aws iam attach-group-policy --group-name $GROUP_NAME --policy-arn arn:aws:iam::aws:policy/$policy
done

# Create IAM User with Console Access and specified password
aws iam create-user --user-name $USER_NAME
aws iam create-login-profile --user-name $USER_NAME --password $PASSWORD --no-password-reset

# Add User to Group
aws iam add-user-to-group --user-name $USER_NAME --group-name $GROUP_NAME

echo "AppDeveloper Setup completed. Nikhil added to the group"

