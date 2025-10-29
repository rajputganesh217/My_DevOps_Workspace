#!/bin/bash
###############################################################################
#     Script Name   :  del_files_by_pattern.sh                                
#     Version       :  3.0                                                   
#     Date          :  28 Oct 2025                                           
#     Credit        :  Team CloudEthix                                       
#     Purpose       :  Deletes files matching a specific pattern.             
###############################################################################

DIR=$1
PATTERN=$2

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <directory_path> <file_pattern>"
    echo "Example: $0 /var/log '*.log'"
    exit 1

elif [[ ! -d "$DIR" ]]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1

else
    FILES_FOUND=$(find "$DIR" -type f -name "$PATTERN")
    if [[ -z "$FILES_FOUND" ]]; then
        echo " No files found matching '$PATTERN' in '$DIR'."
    else
        find "$DIR" -type f -name "$PATTERN" -exec rm -f {} \;
        echo " Files deleted successfully."
    fi
fi
