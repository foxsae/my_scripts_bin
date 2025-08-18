#!/bin/bash
# Remove backup logs older than 30 days
LOGDIR="/mnt/backup/logs"
find "$LOGDIR" -type f -name "*.log" -mtime +30 -exec rm -f {} \;
