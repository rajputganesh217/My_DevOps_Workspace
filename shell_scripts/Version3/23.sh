###########################################################################################
#     Script Name   :  Search_Replace.sh                                                #
#     Version       :  1.1                                                              #
#     Date          :  22 Oct 2025                                                      #
#     Credit        :  Team CloudEthix                                                  #
#     Purpose       :  Search for a specific text in all files of a given directory and #
#                      replace it with another text.                                    #
###########################################################################################

#!/bin/bash

if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <directory> <search_text> <replace_text>"
    exit 1
elif [[ ! -d "$1" ]]; then
    echo "Error: Directory '$1' does not exist."
    exit 1
else
    DIR=$1
    PRESENT=$2
    REPLACE=$3

    for FILE in "$DIR"/*; do
        [[ -f "$FILE" ]] || continue
        sed -i "s/${PRESENT}/${REPLACE}/g" "$FILE" 2>/dev/null \
            && echo " Updated: $FILE" \
            || echo " Failed to update: $FILE"
    done

    echo " Search and replace completed in directory '$DIR'."
fi
