#!/bin/bash



read -p "enter the directory to check:- " SEARCH_DIR
read -p "enter the DAYS  for finding :- " DAYS



echo " files in '$SEARCH_DIR' that haven't been accessed in over $DAYS days..."


find "$SEARCH_DIR" -type f -atime "+$DAYS"

