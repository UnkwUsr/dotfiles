#!/bin/bash
set -euo pipefail

notif() {
    termux-notification --priority high -t "$1" -c "at $(date)"
}

MY_REP="$HOME/device/txts/phone_inbox"
# skip calling sync if nothing actually to commit and push
[[ -z $(git -C "$MY_REP" status --porcelain) ]] \
    && (exit 1)

~/.shortcuts/3sync_to_relay \
    >> ~/.cache/log_auto_sync_out \
    2>>~/.cache/log_auto_sync_err \
    || (notif "sync error" && exit 1)
