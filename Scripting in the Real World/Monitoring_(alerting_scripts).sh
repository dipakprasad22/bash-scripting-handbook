#!/bin/bash
#-----------------------------------------------
# Monitoring and Alerting Script Example
# This script checks CPU and memory usage, and sends an alert if thresholds are exceeded.
# -----------------------------------------------

# Set threshold values
CPU_THRESHOLD=80      # CPU usage percent
MEM_THRESHOLD=80      # Memory usage percent

# Get current CPU usage (average over 1 minute)
# The 'top' command is used in batch mode (-b), and only one iteration (-n1)
# 'grep "Cpu(s)"' finds the line with CPU info
# 'awk' extracts the idle percentage, then calculates usage as 100 - idle
CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Get current memory usage
# 'free -m' shows memory in MB
# 'awk' extracts total and used memory, then calculates usage percent
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_USAGE=$(( MEM_USED * 100 / MEM_TOTAL ))

# Print current metrics
echo "Current CPU Usage: $CPU_USAGE%"
echo "Current Memory Usage: $MEM_USAGE%"

# Check if CPU usage exceeds threshold
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "ALERT: CPU usage is above $CPU_THRESHOLD%!"
    # Here you could send an email, Slack message, etc.
fi

# Check if memory usage exceeds threshold
if (( MEM_USAGE > MEM_THRESHOLD )); then
    echo "ALERT: Memory usage is above $MEM_THRESHOLD%!"
    # Here you could send an email, Slack message, etc.
fi

# Exit the script
exit 0