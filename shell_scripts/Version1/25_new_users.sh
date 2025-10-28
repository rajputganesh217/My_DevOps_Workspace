#!/bin/bash

REPORT=$(find /home -maxdepth 1 -mindepth 1 -type d -mtime -1)


if [ -n "$REPORT" ]; then
    echo -e "New users created in the last 24 hours:\n$REPORT" 
   
else
    echo "No new users in the last 24 hours."
fi
