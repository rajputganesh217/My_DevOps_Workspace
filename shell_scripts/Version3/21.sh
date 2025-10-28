##############################################################################################
#     Script Name   :  User_Disk_Usage.sh                                                    #
#     Version       :  2.0                                                                   #
#     Date          :  26 Oct 2025                                                           #
#     Credit        :  Team CloudEthix                                                       #
#     Purpose       :  Shows total disk space used by a specific user in human-readable form.#
##############################################################################################

#!/bin/bash

USERNAME=$1

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <username>"
    exit 1
elif ! id "$USERNAME" &>/dev/null; then
    echo "Error: User '$USERNAME' does not exist."
    exit 1
else
    TOTAL_USAGE=$(find / -user "$USERNAME" -type f -exec du -b {} + 2>/dev/null | awk '{sum += $1} END {print sum}')
    HUMAN_READABLE=$(numfmt --to=iec --suffix=B "$TOTAL_USAGE" 2>/dev/null)
    echo
    echo " Total disk space used by user '$USERNAME': $HUMAN_READABLE"
fi
