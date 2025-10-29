#!/bin/bash



############################################################################
#     Script Name   :  list_directory_files.sh                             #               
#     Version       :  2.0                                                 #                 
#     Date          :  17 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to list given directory # 
#                     files and store result in directory_content.txt fie. #
###########################################################################


DIR=$1  


if [[ -z "$DIR" ]]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi


if [[ ! -d "$DIR" ]]; then
    echo "Error: '$DIR' is not a valid directory."
    exit 1
fi


{
    echo "------------------------- $(date) -------------------------"
    echo "Directory: $DIR"
    echo "------------------------------------------------------------"
    ls "$DIR"
    echo ""
} >> directory_content.txt

echo "List of files added to directory_content.txt"
