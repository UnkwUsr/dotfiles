#!/bin/bash
GATHER_REPEAT_INTERVAL="8h"
GATHER_INBOX_LOG="/tmp/gather_inbox.sh.log"
(sleep 5m && while true; do
    notify-send -t 1000 "Running gather-inbox"
    echo >> "$GATHER_INBOX_LOG"
    if gather-inbox.sh >> "$GATHER_INBOX_LOG" 2>&1; then
        notify-send -t 1000 "gather-inbox done succesfully"
    else
        notify-send -u critical "gather-inbox done with error"
    fi
    sleep $GATHER_REPEAT_INTERVAL
done)
