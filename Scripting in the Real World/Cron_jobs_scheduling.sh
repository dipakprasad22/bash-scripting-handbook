#!/bin/bash
# -----------------------------------------------
# Cron Jobs & Scheduling - Bash Script Example
# This script demonstrates how to schedule tasks using cron
# -----------------------------------------------

# 1. Print current date and time
echo "Step 1: Displaying current date and time..."
date
# 'date' prints the current system date and time.

# 2. Create a sample log file
LOGFILE="$HOME/cron_example.log"
echo "Step 2: Creating a log file at $LOGFILE"
touch "$LOGFILE"
# 'touch' creates an empty file if it doesn't exist.

# 3. Write a message to the log file
echo "Step 3: Writing a message to the log file..."
echo "Cron job ran at $(date)" >> "$LOGFILE"
# 'echo' writes a message with the current date/time to the log file.

# 4. Show how to schedule this script with cron
echo "Step 4: To schedule this script to run every minute, add the following line to your crontab:"
echo "* * * * * /bin/bash $PWD/$(basename $0)"
# This line means: run the script every minute.
# The five stars represent: minute, hour, day of month, month, day of week.

# 5. How to edit your crontab
echo "Step 5: To edit your crontab, run:"
echo "crontab -e"
# This opens your crontab file in the default editor.

# 6. How to view scheduled cron jobs
echo "Step 6: To view your scheduled cron jobs, run:"
echo "crontab -l"
# This lists all cron jobs for your user.

# 7. Reminder about script permissions
echo "Step 7: Make sure your script is executable:"
echo "chmod +x $PWD/$(basename $0)"
# 'chmod +x' makes the script executable.

# End of script
echo "Script demonstration complete."