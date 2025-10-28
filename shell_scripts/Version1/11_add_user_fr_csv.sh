#!/bin/bash

read -p "enter file name:- " csv_file

while IFS="," read -r name lastname
do 
   useradd -m -c  $lastname $name

done < "$csv_file"
