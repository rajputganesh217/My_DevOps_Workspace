#!/bin/bash
read -p "enter your source directory with path :-" SOURCE_DIR
read -p "enter your remote username :- "  REMOTE_USER
read -p "enter your remote server ip :-" REMOTE_HOST_IP
read -p "enter destination Dir :-" REMOTE_DIR
LOG_FILE="/var/log/backup.log"
DATE=$(DATE +'%Y-%m-%d-%H-%M-%s')

echo "[$DATE] starting backup ..." >> "$LOG_FILE"
rsync -avz -e ssh "$SOURCE_DIR" "${REMOTE_USER}@${REMOTE_HOST_IP}:{REMOTE_DIR}" >> "$LOG_FILE" 2>&1

if [ $? == 0 ]; then

  	echo " backup completed"

else

	echo " backup failed"

fi
	echo "backup finished logs at $LOG_FILE"

