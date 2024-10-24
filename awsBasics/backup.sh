#!/bin/bash
# Variables
STATIC_WEBSITE_BUCKET="static-bucket"
BACKUP_BUCKET="backup-bucket"
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
BACKUP_PATH="s3://$BACKUP_BUCKET/backup-$TIMESTAMP/"

# Backup command
echo "Starting backup of $STATIC_WEBSITE_BUCKET to $BACKUP_PATH..."

# Sync the content of the static website bucket to the backup bucket
aws s3 sync s3://$STATIC_WEBSITE_BUCKET $BACKUP_PATH

if [ $? -eq 0 ]; then
    echo "Backup successful!"
else
    echo "Backup failed!"
    exit 1
fi