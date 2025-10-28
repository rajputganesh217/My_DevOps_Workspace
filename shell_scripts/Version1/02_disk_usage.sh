#!/bin/bash
THRESHOLD=80
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$USAGE" -ge "$THRESHOLD" ]; then
echo "warning : disk usage is at ${USAGE}% on $(hostname)" | mail -s "Disk Alert: $(hostname)" example.com

else
    echo "Disk usage is normal: ${USAGE}% used."

fi

