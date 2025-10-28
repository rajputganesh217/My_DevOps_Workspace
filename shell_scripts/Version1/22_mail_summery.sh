#!/bin/bash

EMAIL="testuser@gmail.com"

SUBJECT="Daily System Log Summary - $(date '+%Y-%m-%d')"

tail -n 15 /var/log/messages | mail -s "$SUBJECT" "$EMAIL"

echo "Daily log summary sent to $EMAIL."


