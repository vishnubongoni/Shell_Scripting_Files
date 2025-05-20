#!/bin/bash
#
#
##############################
#Author: Vishnu
#Date:12/05/2025
#
#To automate the process and backing up important data
#
#Version:v1
##################################

BACKUP_DIR="/opt/mydata"
BACKUP_DEST="/var/backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DEST"

# Create a compressed tar archive
echo "Creating backup archive: $ARCHIVE_NAME"
tar -czvf "$BACKUP_DEST/$ARCHIVE_NAME" "$BACKUP_DIR"

echo "Backup completed successfully!"
