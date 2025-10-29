###############################################################################
#     Script Name   :  10_ip_details.sh                                
#     Version       :  1.0                                                   
#     Date          :  17 Oct 2025                                           
#     Credit        :  Team CloudEthix                                       
#     Purpose       : find ip adresses of instances           
###############################################################################


#!/bin/bash

read -p "Enter the JSON file name : " JSON_FILE
#aws ec2 describe-instances \
 # --query 'Reservations[].Instances[].{ID:InstanceId,Private:PrivateIpAddress,Public:PublicIpAddress}' \
 # --output json > instances.json

 jq -r '.Reservations[].Instances[] | "Instance ID: \(.InstanceId), Private IP: \(.PrivateIpAddress), Public IP: \(.PublicIpAddress)"' "$JSON_FILE"
