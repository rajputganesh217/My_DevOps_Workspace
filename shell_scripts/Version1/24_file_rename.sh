#!/bin/bash

read -p "Enter directory path: " DIR
read -p "Enter new base name like (report , project): " BASE

COUNT=1

for FILE in "$DIR"/*; do
    if [[ -f "$FILE" ]]; then
        EXT="${FILE##*.}"                  
        mv "$FILE" "$DIR/$BASE$COUNT.$EXT" 
        echo "Renamed: $FILE -> $BASE$COUNT.$EXT"
        ((COUNT++))
    fi
done

echo "All files renamed successfully."
