#!/bin/bash
# -------------------------------------------------------------
# Automated Backup Script
# This script creates a compressed backup of a specified directory, encrypts it, and uploads it to a remote server.
# -------------------------------------------------------------

# Define variables for backup
SOURCE_DIR="/path/to/data"           # Directory to backup
BACKUP_DIR="/path/to/backups"        # Where to store local backup files
DATE=$(date +"%Y-%m-%d_%H-%M-%S")    # Timestamp for unique backup names
BACKUP_FILE="backup_$DATE.tar.gz"    # Name of the backup archive
ENCRYPTED_FILE="$BACKUP_FILE.gpg"    # Name of the encrypted backup
REMOTE_USER="youruser"               # Remote server username
REMOTE_HOST="your.remote.server"     # Remote server address
REMOTE_PATH="/remote/backup/path"    # Remote directory for uploads
GPG_RECIPIENT="backup@yourdomain.com" # GPG key recipient for encryption

# Step 1: Create a compressed tar archive of the source directory
# The 'tar' command combines files into a single archive and compresses it with gzip.
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" . 

# Step 2: Encrypt the backup archive using GPG
# 'gpg --output ... --encrypt --recipient ...' encrypts the file for the specified recipient.
gpg --output "$BACKUP_DIR/$ENCRYPTED_FILE" --encrypt --recipient "$GPG_RECIPIENT" "$BACKUP_DIR/$BACKUP_FILE"

# Step 3: Upload the encrypted backup to a remote server using scp
# 'scp' securely copies files over SSH to the remote server.
scp "$BACKUP_DIR/$ENCRYPTED_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

# Step 4: (Optional) Remove local backup files to save space
# Uncomment the following lines if you want to delete local copies after upload.
# rm "$BACKUP_DIR/$BACKUP_FILE"
# rm "$BACKUP_DIR/$ENCRYPTED_FILE"

# Step 5: Print completion message
echo "Backup, encryption, and upload completed successfully at $DATE."