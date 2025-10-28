#!/bin/bash

read -p "Enter the name of User you want to check : " USERNAME

TOTAL_USAGE=$(find / -user "$USERNAME" -type f -exec du -b {} + 2>/dev/null | awk '{sum += $1} END {print sum}')

HUMAN_READABLE=$(numfmt --to=iec --suffix=B "$TOTAL_USAGE")

echo
echo "Total disk space used by user '$USERNAME': $HUMAN_READABLE"
