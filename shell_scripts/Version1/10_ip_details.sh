#!/bin/bash

read -p "Enter the JSON file name : " JSON_FILE
#aws ec2 describe-instances \
 # --query 'Reservations[].Instances[].{ID:InstanceId,Private:PrivateIpAddress,Public:PublicIpAddress}' \
 # --output json > instances.json

 jq -r '.Reservations[].Instances[] | "Instance ID: \(.InstanceId), Private IP: \(.PrivateIpAddress), Public IP: \(.PublicIpAddress)"' "$JSON_FILE"
