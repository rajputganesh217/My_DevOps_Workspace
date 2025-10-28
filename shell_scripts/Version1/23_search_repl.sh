#!/bin/bash

read -p "Enter directory path: " DIR
read -p "Enter the text which to search and replace for: " PRESENT
read -p "Enter the replacement text: " REPLACE

for FILE in "$DIR"/*; do
    if [[ -f "$FILE" ]]; then
        sed -i "s/${PRESENT}/${REPLACE}/g" "$FILE"
        echo "Updated: $FILE"
    fi
done

echo "completed Search and replace ."
