###########################################################################################
#     Script Name   :  Monitor_File.sh                                                    #
#     Version       :  2.0                                                                #
#     Date          :  22 Oct 2025                                                        #
#     Credit        :  Team CloudEthix                                                    #
#     Purpose       :  Shell script to monitor a specified file for modifications.        #
#                      Supports real-time monitoring using inotifywait or periodic check. #
###########################################################################################

#!/bin/bash

FILE=$1

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file_to_monitor>"
    exit 1
elif [[ ! -f "$FILE" ]]; then
    echo "Error: File '$FILE' not found."
    exit 1
elif command -v inotifywait &>/dev/null; then
    echo "Watching for changes in $FILE (real-time mode)..."
    inotifywait -m -e modify "$FILE" --format '%T %e' --timefmt '%H:%M:%S' |
    while read time event; do
        echo "[$time] File modified! Event: $event"
    done
else
    echo "inotifywait not found, switching to periodic monitoring..."
    LAST_MOD=$(stat -c %Y "$FILE")
    while true; do
        sleep 2
        NEW_MOD=$(stat -c %Y "$FILE")
        if [[ "$NEW_MOD" != "$LAST_MOD" ]]; then
            echo "[$(date +%H:%M:%S)] File modified!"
            LAST_MOD=$NEW_MOD
        fi
    done
fi
