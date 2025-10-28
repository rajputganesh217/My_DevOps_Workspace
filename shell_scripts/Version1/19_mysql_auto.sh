#!/bin/bash

read -p "Enter MySQL root password: " ROOT_PASS
read -p "Enter new database name: " DB_NAME
read -p "Enter new username: " DB_USER
read -sp "Enter password for new user: " DB_PASS
echo
mysql -u root -p"$ROOT_PASS" -e "
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
"

if [ $? -eq 0 ]; then
    echo " Database '${DB_NAME}' and user '${DB_USER}' created successfully."
else
    echo " Failed to create database or user. Please try again."
fi 
