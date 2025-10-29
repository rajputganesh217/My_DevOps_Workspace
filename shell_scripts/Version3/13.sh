###################################################################################
#     Script Name   :  create_vhost.sh                                            #
#     Version       :  3.0                                                        #
#     Date          :  28 Oct 2025                                                #
#     Credit        :  Team CloudEthix                                            #
#     Purpose       :  Shell script to create an Apache virtual host for a domain #
#                        and reload Apache safely.                               #
###################################################################################

#!/bin/bash

create_vhost() {
    if [ "$EUID" -ne 0 ]; then
        echo " Please run this script as root."
        exit 1
    elif [ -z "$1" ]; then
        echo " Usage: $0 <domain_name>"
        echo " Example: $0 example.com"
        exit 1
    else
        DOMAIN=$1
        DIR="/var/www/$DOMAIN"
        CONF="/etc/httpd/conf.d/$DOMAIN.conf"

        mkdir -p "$DIR" && echo "$DOMAIN is live!" > "$DIR/index.html"

        if cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
</VirtualHost>
EOF
        then
            if systemctl reload httpd; then
                echo " $DOMAIN virtual host created and Apache reloaded successfully!"
            else
                echo " Failed to reload Apache. Please check configuration."
            fi
        else
            echo " Failed to create virtual host config file."
        fi
    fi
}


create_vhost "$@"
