#!/bin/bash

read -p "enter name of local dir :- " LOCAL_DIR
read -p "enter name of remote user :-" REMOTE_USER
read -p "enter IP or remote server :- " REMOTE_HOST
read -p "enter remote dir name:- " REMOTE_DIR

rsync -avzh --delete $LOCAL_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

