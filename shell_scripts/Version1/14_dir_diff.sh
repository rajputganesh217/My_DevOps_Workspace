#!/bin/bash
read -p " enter directory  one :- " DIR1
read -p " enter directory  two :- " DIR2

diff -q "$DIR1" "$DIR2"

if diff -q "$DIR1" "$DIR2" >/dev/null; then
        echo "There is no difference between the directories."
    else
        echo "There is a difference between the directories."
 fi
