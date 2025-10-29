#!/bin/bash
###############################################################################
#     Script Name   :  check_site_status.sh                                  
#     Version       :  3.0                                                  
#     Date          :  28 Oct 2025                                          
#     Credit        :  Team CloudEthix                                      
#     Purpose       :  Shell script to check site status using curl.         
###############################################################################

#!/bin/bash

SITE=$1

if [[ -z "$SITE" ]]; then
    echo "Usage: $0 <website_url>"
    echo "Example: $0 www.google.com"
    exit 1
else
    [[ "$SITE" != http* ]] && SITE="https://$SITE"

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "$SITE")

    if [[ "$HTTP_CODE" -ge 200 && "$HTTP_CODE" -lt 400 ]]; then
        echo "$SITE is UP (HTTP $HTTP_CODE)"
    else
        echo "$SITE is DOWN (HTTP $HTTP_CODE)"
    fi
fi
