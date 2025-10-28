#!/bin/bash

############################################################################
#     Script Name   :  list_directory_files.sh                             #               
#     Version       :  3.0                                                 #                 
#     Date          :  28 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  Lists files in a given directory (passed as argument)#
#                     and saves output to directory_content.txt file.      #
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
