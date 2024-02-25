#!/bin/bash

# Specify the directory where log files are stored
log_directory="/path/to/log/directory"

# Specify the threshold for disk usage in percentage (e.g., 90%)
threshold_percentage=90

# Find and delete log files older than a certain number of days
find "$log_directory" -type f -name "*.log" -mtime +7 -exec rm {} \;

# Check disk usage
current_disk_usage=$(df -h --output=pcent "$log_directory" | tail -n 1 | tr -d '% ')

# If disk usage exceeds the threshold, send an alert (adjust as needed)
if [ "$current_disk_usage" -gt "$threshold_percentage" ]; then
    echo "Disk usage exceeded threshold. Current usage: $current_disk_usage%"
    # Add additional actions or alerts here (e.g., notify the app team)
fi

# Schedule this script to run periodically using a cron job. Open crontab file
# crontab -e

# Add a line to schedule the script to run, for example, every day and midnight:
# 0 0 * * * /path/to/cleanup_logs.sh


