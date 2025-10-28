#!/bin/bash
read -p " enter the directory you want to cleanup (with path) :-"  DIR
read -p "enter the file pattern(.log, .txt) :-" PATTERN
find "$DIR" -type f -name "$PATTERN" -exec rm -f {} \;
    echo "files deleted"
