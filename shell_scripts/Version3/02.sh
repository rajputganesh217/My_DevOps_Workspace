#!/bin/bash

################################################################################
#     Script Name   :  check_disk_usage.sh                                     #               
#     Version       :  3.0                                                     #                 
#     Date          :  26 Oct 2025                                             #               
#     Credit        :  Team CloudEthix                                         #             
#     Purpose       :  Checks server disk utilization and emails alert if      #
#                      any partition exceeds the given threshold.              #                                                                         
################################################################################

THRESHOLD=$1
ALERT_FLAG=0
REPORT_FILE="/tmp/disk_usage_report.txt"


function DISK_ALERT_EMAIL() {
    local SERVER_IP=$(hostname -I | awk '{print $1}')
    echo -e "Hello All, 
This is a system-generated email. Do not reply.

One or more partitions on the server have exceeded the disk usage threshold of ${THRESHOLD}%!

Server Details:
- Server Name: $(hostname)
- Server IP  : $SERVER_IP

Please take necessary action ASAP to avoid issues.

Thank You,
Team CloudEthix" | mail -s " Disk Usage Alert on $(hostname)" admin@example.com
}

if [[ $# -ne 1 || ! "$THRESHOLD" =~ ^[0-9]+$ || "$THRESHOLD" -lt 1 || "$THRESHOLD" -gt 100 ]]; then
    echo "Usage: $0 <THRESHOLD>"
    echo "Example: $0 80"
    exit 1
fi

df -h --output=source,target,pcent | grep -vE 'tmpfs|loop' | tail -n +2 > "$REPORT_FILE"

echo "Disk Usage Report for $(hostname):"
echo "----------------------------------------"

while read -r line; do
    DEVICE=$(echo $line | awk '{print $1}')
    MOUNT=$(echo $line | awk '{print $2}')
    USAGE=$(echo $line | awk '{print $3}' | sed 's/%//')

    if (( USAGE >= THRESHOLD )); then
        echo "  WARNING: $MOUNT ($DEVICE) usage is at ${USAGE}%"
        ALERT_FLAG=1
    else
        echo " $MOUNT ($DEVICE) usage is normal: ${USAGE}%"
    fi
done < "$REPORT_FILE"

echo "----------------------------------------"

if (( ALERT_FLAG )); then
    echo " One or more partitions exceed ${THRESHOLD}%!"
    DISK_ALERT_EMAIL
else
    echo " All partitions are below the ${THRESHOLD}% threshold."
fi
