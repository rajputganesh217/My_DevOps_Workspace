###################################################################################
#     Script Name   :  loc_remote_rsync.sh                                       #
#     Version       :  3.0                                                       #
#     Date          :  26 Oct 2025                                               #
#     Credit        :  Team CloudEthix                                           #
#     Purpose       :  Sync a local directory with a remote host directory       #
###################################################################################

#!/bin/bash

sync_backup() {
    local local_dir=$1
    local remote_port=$2
    local remote_user=$3
    local remote_host=$4
    local remote_dir=$5

    # Check for valid input
    if [[ $# -ne 5 ]]; then
        echo "Usage: $0 local_dir remote_port remote_user remote_host_ip remote_dir"
        return 1
    elif [[ ! -d "$local_dir" ]]; then
        echo "Local directory '$local_dir' not found."
        return 1
    elif ! nc -z -w5 "$remote_host" "$remote_port" 2>/dev/null; then
        echo "Cannot connect to $remote_host on port $remote_port."
        return 1
    fi

    echo "Starting rsync..."
    if rsync -avzh -e "ssh -p $remote_port" --delete "$local_dir/" "$remote_user@$remote_host:$remote_dir/"; then
        echo "Backup completed successfully."
    else
        echo "Backup failed. Check network or permissions."
        return 1
    fi
}

sync_backup "$@"
