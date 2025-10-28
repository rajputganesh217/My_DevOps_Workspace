#!/bin/bash



############################################################################
#     Script Name   :  list_directory_files.sh                             #               
#     Version       :  3.0                                                 #                 
#     Date          :  28 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  A shell script program file to list given directory # 
#                     files and store result in directory_content.txt fie. #
###########################################################################


read -p "ENTER THE DIRECTORY  NAME WITH PATH YOU WANT TO LIST :- " DIR

if [[ ! -d "$DIR" ]]; then
    echo "NOT A VALID DIRECTORY PLEASE CHECK NAME AND PATH YOU GIVEN ."
else
    {
        echo "------------------------- $(date) -------------------------"
        echo "Directory: $DIR"
        echo "------------------------------------------------------------"
        ls "$DIR"
        echo ""
    } >> directory_content.txt
    echo " list of files added to  directory_content.txt"
fi

