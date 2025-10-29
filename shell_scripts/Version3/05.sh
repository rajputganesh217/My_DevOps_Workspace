#!/bin/bash
###############################################################################
#     Script Name   :  update_software.sh                                    
#     Version       :  3.0                                                   
#     Date          :  28 Oct 2025                                           
#     Credit        :  Team CloudEthix                                       
#     Purpose       :  Updates a given service package (like Nginx, Apache). 
###############################################################################

SERVICE=$1

if [[ -z "$SERVICE" ]]; then
    echo " Error: Missing service name."
    echo "Usage: $0 <service_name>"
    exit 1
fi

if ! systemctl list-unit-files | grep -qw "$SERVICE.service"; then
    echo " Error: Service '$SERVICE' does not exist."
    exit 1
fi

if command -v yum &>/dev/null; then
    PKG_MGR="yum"
elif command -v dnf &>/dev/null; then
    PKG_MGR="dnf"
elif command -v apt &>/dev/null; then
    PKG_MGR="apt"
else
    echo " Error: No supported package manager found (yum/dnf/apt)."
    exit 1
fi

echo " Starting update for $SERVICE using $PKG_MGR..."


sudo $PKG_MGR -y update "$SERVICE" &>/dev/null || sudo $PKG_MGR -y install --only-upgrade "$SERVICE" &>/dev/null

if [[ $? -eq 0 ]]; then
    echo " Update of $SERVICE completed successfully."
else
    echo " Update failed. Please check manually."
    exit 1
fi
