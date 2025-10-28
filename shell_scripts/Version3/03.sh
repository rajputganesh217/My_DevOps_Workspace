#!/bin/bash
############################################################################
#     Script Name   :  check_service_status.sh                             #               
#     Version       :  3.0                                                 #                 
#     Date          :  26 Oct 2025                                         #               
#     Credit        :  Team CloudEthix                                     #             
#     Purpose       :  Checks status of a service and restarts if stopped. #
############################################################################

check_service() {
    local SERVICE=$1

    if [[ -z "$SERVICE" ]]; then
        echo "Error: Missing service name."
        echo "Usage: $0 <service_name>"
        exit 1

    elif ! systemctl list-unit-files | grep -qw "$SERVICE.service"; then
        echo "Error: Service '$SERVICE' does not exist."
        exit 1

    elif ! systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is not running. Attempting to restart..."
        if systemctl restart "$SERVICE"; then
            echo "$SERVICE has been restarted successfully."
        else
            echo "Failed to restart $SERVICE. Please check manually."
            exit 1
        fi

    else
        echo "$SERVICE is running."
    fi
}


check_service "$1"
