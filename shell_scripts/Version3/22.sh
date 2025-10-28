###########################################################################################
#     Script Name   :  Daily_Log_Email.sh                                                #
#     Version       :  2.0                                                               #
#     Date          :  22 Oct 2025                                                       #
#     Credit        :  Team CloudEthix                                                   #
#     Purpose       :  Send the last 15 lines of /var/log/messages as a daily system     #
#                      log summary to a specified email address.                         #
###########################################################################################

#!/bin/bash


function DAILY_LOG_REPORT() {
    echo -e "Hello Team,

This is a system-generated email. Please do not reply.

Below are the last 15 lines from the system log of server $(hostname):

$(tail -n 15 "$LOG_FILE")

Server Name : $(hostname)
Server IP   : $(ifconfig | grep inet | head -n 1 | awk '{print $2}')

Regards,
Team CloudEthix"
}

EMAIL=$1
SUBJECT="Daily System Log Summary - $(date '+%Y-%m-%d')"
LOG_FILE="/var/log/messages"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <email_address>"
    exit 1
elif [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

if DAILY_LOG_REPORT | mail -s "$SUBJECT" "$EMAIL"; then
    echo "Daily log summary sent successfully to $EMAIL."
else
    echo "Failed to send daily log summary to $EMAIL. Check mail configuration."
    exit 1
fi
