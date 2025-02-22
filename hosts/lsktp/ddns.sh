#!/usr/bin/env bash

HOST=lsktp
DOMAIN=c31.io
PASSWD=$(cat /home/c31io/.ssh/ddns)
DEVICE=enp0s31f6
IP_CACHE=/var/cache/ddns

if [ "$1" == "$DEVICE" ]; then
    CURRENT_IP=$(ip a s enp0s31f6 | grep "inet " | sed 's/    inet \([^/]*\)\/.*$/\1/')

    if [ -f "$IP_CACHE" ]; then
        LAST_IP=$(cat "$IP_CACHE")
    else
        LAST_IP=""
    fi

    if [ "$CURRENT_IP" != "$LAST_IP" ]; then
        curl -s "https://dynamicdns.park-your-domain.com/update?host=$HOST&domain=$DOMAIN&password=$PASSWD&ip=$CURRENT_IP" > /dev/null
        echo "$CURRENT_IP" > "$IP_CACHE"
        logger -t ddns "$HOST.$DOMAIN $CURRENT_IP"
    fi
fi
