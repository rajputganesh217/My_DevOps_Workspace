###########################################################################################
#     Script Name   :  New_Users_Report.sh                                                 #
#     Version       :  1.1                                                                 #
#     Date          :  22 Oct 2025                                                         #
#     Credit        :  Team CloudEthix                                                     #
#     Purpose       :  Check for new user directories created in the last 24 hours under   #
#                      a specified base directory (default: /home).                        #
###########################################################################################

#!/bin/bash

BASE_DIR=${1:-/home}

if [[ ! -d "$BASE_DIR" ]]; then
    echo "Error: Directory '$BASE_DIR' does not exist."
    exit 1
else
    REPORT=$(find "$BASE_DIR" -maxdepth 1 -mindepth 1 -type d -mtime -1 2>/dev/null)

    if [[ -n "$REPORT" ]]; then
        echo -e "New users created in the last 24 hours:\n$REPORT"
    else
        echo "No new users in the last 24 hours in '$BASE_DIR'."
    fi
fi
