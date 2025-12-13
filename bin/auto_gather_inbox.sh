#!/bin/bash
GATHER_REPEAT_INTERVAL="8h"
GATHER_INBOX_LOG="/tmp/gather_inbox.sh.log"
(sleep 5m && while true; do
    echo >> "$GATHER_INBOX_LOG"
    if ! gather-inbox.sh >> "$GATHER_INBOX_LOG" 2>&1; then
        echo "gather-inbox done with error" >> ~/error-in-auto-gather-inbox
    fi
    sleep $GATHER_REPEAT_INTERVAL
done)
