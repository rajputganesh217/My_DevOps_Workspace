#!/bin/bash

LOG_FILE="/var/log/update.log"
DATE=$(date +'Y%-%m-%d-%H:%M:%s')
read -p "enter the service name you want to update:- " SERVICE
sudo yum update $SERVICE -y 

if [ $? == 0 ]; then
    echo "[$DATE] update COMPLETED SUCCESSFULLY." 
else 
    echo "[$DATE] SYSTEM UPDATE FAILED. " 

fi

    echo "update process finished "
