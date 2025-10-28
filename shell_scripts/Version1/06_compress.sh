#bin/bash
read -p " enter your log dir with path:- " LOG_DIR
ARCHIVE_DIR="$LOG_DIR/archive"
read -p " enter how many days old log you want to compress :- " DAYS_OLD

mkdir -p "$ARCHIVE_DIR"

tar -czf "$ARCHIVE_DIR/logs_$(date +%Y-%m-%d).tar.gz" $(find  "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD)


find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec rm -f {} \;
