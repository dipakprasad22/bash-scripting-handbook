#!/bin/bash
# -------------------------------------------------------------
# Log Rotation & Compression Script
# This script rotates a log file, compresses the old log, and keeps only a set number of backups.
# --------------------------------------------------------------

# 1. Set variables for log file and backup settings
LOG_FILE="/var/log/myapp.log"           # Path to the log file to rotate
BACKUP_DIR="/var/log/myapp-archive"     # Directory to store compressed backups
MAX_BACKUPS=5                           # Number of compressed backups to keep

# 2. Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"
# 'mkdir -p' creates the directory if missing; '-p' avoids error if it already exists.

# 3. Get current date/time for backup filename
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
# 'date' formats the current date/time for unique backup names.

# 4. Check if log file exists and is not empty
if [ -s "$LOG_FILE" ]; then
    # '-s' checks if file exists and is not zero size.

    # 5. Move the current log file to backup directory with timestamp
    mv "$LOG_FILE" "$BACKUP_DIR/myapp.log.$TIMESTAMP"
    # 'mv' renames and moves the log file for archiving.

    # 6. Compress the rotated log file using gzip
    gzip "$BACKUP_DIR/myapp.log.$TIMESTAMP"
    # 'gzip' compresses the file to save space.

    # 7. Recreate the original log file (empty) for new logs
    touch "$LOG_FILE"
    # 'touch' creates a new empty log file so the application can continue logging.

    # 8. Set permissions (optional, for security)
    chmod 644 "$LOG_FILE"
    # 'chmod 644' sets readable permissions for owner and group.

    # 9. Remove old backups, keeping only the newest $MAX_BACKUPS files
    # Find all compressed backups, sort by modification time, skip newest $MAX_BACKUPS, and delete the rest
    mapfile -t backups < <(find "$BACKUP_DIR" -maxdepth 1 -type f -name 'myapp.log.*.gz' -printf '%T@ %p\n' | sort -r -n | awk '{print $2}')
    if (( ${#backups[@]} > MAX_BACKUPS )); then
        for ((i=MAX_BACKUPS; i<${#backups[@]}; i++)); do
            rm -- "${backups[i]}"
        done
    fi
    # 'find ... -printf' lists files with timestamps for reliable sorting.
    # 'sort -r -n' sorts newest first.
    # 'awk' extracts filenames.
    # 'mapfile' reads into array safely.
    # The loop deletes only files beyond the newest $MAX_BACKUPS.

else
    echo "Log file $LOG_FILE does not exist or is empty. No rotation needed."
    # If log file is missing or empty, print a message and exit.
fi