#!/bin/bash

read -p "Enter website URL ( www.domain.com): " SITE

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "$SITE")

# Check if HTTP code is 200-399
if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "$SITE is UP (HTTP $HTTP_CODE)"
else
    echo "$SITE is Down (HTTP $HTTP_CODE)"
fi
