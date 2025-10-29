
############################################################################
#     Script Name   :  list_directory_files.sh                             #               
#     Version       :  3.0                                                 #                 
#     Date          :  28 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  Lists files in a given directory (passed as argument)#
#                     and saves output to directory_content.txt file.      #
############################################################################

#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIR="$1"


if [[ ! -d "$DIR" ]]; then
    echo "Error: '$DIR' is not a valid directory. Please check the name and path."
    exit 1
fi


{
    echo "------------------------- $(date) -------------------------"
    echo "Directory: $DIR"
    echo "------------------------------------------------------------"
    ls "$DIR"
    echo ""
} >> directory_content.txt

echo "List of files from '$DIR' added to directory_content.txt"
