###########################################################################################
#     Script Name   :  Check_Old_Files.sh                                                 #
#     Version       :  3.0                                                                #
#     Date          :  28 Oct 2025                                                        #
#     Credit        :  Team CloudEthix                                                    #
#     Purpose       :  Shell script to find & list files in a specified directory that    #
#                      have not been accessed in the last N days.                         #
###########################################################################################

#!/bin/bash

SEARCH_DIR=$1
DAYS=$2

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <directory> <days>"
    exit 1
elif [[ ! -d "$SEARCH_DIR" ]]; then
    echo "Error: Directory '$SEARCH_DIR' does not exist."
    exit 1
elif ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Error: Days must be a positive number."
    exit 1
else
    echo "Files in '$SEARCH_DIR' that haven't been accessed in over $DAYS days..."
    find "$SEARCH_DIR" -type f -atime "+$DAYS" 2>/dev/null || {
        echo "Error: Failed to search files in '$SEARCH_DIR'."
        exit 1
    }
fi
