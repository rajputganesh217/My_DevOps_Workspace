#!/bin/bash
###############################################################################
#     Script Name   :  create_usr_fr_csv.sh                                  
#     Version       :  2.1                                                   
#     Date          :  26 Oct 2025                                           
#     Credit        :  Team CloudEthix                                       
#     Purpose       :  Creates users from names listed in a CSV file.        
###############################################################################

CSV_FILE=$1

if [[ -z "$CSV_FILE" || ! -f "$CSV_FILE" ]]; then
    echo " Error: CSV file missing or not found."
    echo "Usage: $0 <csv_file>"
    exit 1
else
    while IFS="," read -r name lastname; do
        if [[ -n "$name" && -n "$lastname" ]]; then
            if useradd -m -c "$lastname" "$name" 2>/dev/null; then
                echo " User '$name' created successfully."
            else
                echo " Failed to create user '$name' (might already exist)."
            fi
        else
            echo " Skipping invalid line: '$name,$lastname'"
        fi
    done < "$CSV_FILE"
fi
