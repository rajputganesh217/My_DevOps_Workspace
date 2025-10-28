#!/bin/bash
read -p " eneter the service you want to check:-" SERVICE
service "$SERVICE" status > /dev/null 2>&1
if [ $? != 0 ]; then
echo "$SERVICE is not running. Restarting.."
service "$SERVICE" restart
else
	echo "$SERVICE  is running."
fi
