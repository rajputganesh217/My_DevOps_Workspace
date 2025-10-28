###################################################################################################
#     Script Name   :  Rename_Files.sh                                                            # 
#     Version       :  3.0                                                                        #
#     Date          :  28 Oct 2025                                                                #
#     Credit        :  Team CloudEthix                                                            #
#     Purpose       :  Rename all files in a directory with a new base name and incremental number #
#                      while preserving extensions.                                               #
###################################################################################################

#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <directory> <new_base_name>"
    exit 1
elif [[ ! -d "$1" ]]; then
    echo "Error: Directory '$1' does not exist."
    exit 1
else
    DIR=$1
    BASE=$2
    COUNT=1

    for FILE in "$DIR"/*; do
        [[ -f "$FILE" ]] || continue
        EXT="${FILE##*.}"
        NEW_NAME="$DIR/$BASE$COUNT.$EXT"

        mv "$FILE" "$NEW_NAME" 2>/dev/null \
            && echo " Renamed: $FILE -> $NEW_NAME" \
            && ((COUNT++)) \
            || echo " Failed to rename: $FILE"
    done

    echo " All files renamed successfully in '$DIR'."
fi
