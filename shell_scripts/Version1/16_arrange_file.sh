#!/bin/bash

read -p "Enter directory: " DIR
cd "$DIR" || exit

mkdir -p Images Documents Audio Others

for FILE in *; do
    [[ -f "$FILE" ]] || continue

    case "$FILE" in
        *.jpg|*.png|*.gif) mv "$FILE" Images/ ;;
        *.pdf|*.txt|*.docx) mv "$FILE" Documents/ ;;
        *.mp3|*.wav) mv "$FILE" Audio/ ;;
        *) mv "$FILE" Others/ ;;
    esac
done
