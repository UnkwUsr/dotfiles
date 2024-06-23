#!/bin/sh

period_ms=$((16 * 60 * 60 * 1000))
termux-job-scheduler -s ~/.dotfiles/bin/termux/auto-sync/helper_for_autosync.sh \
    --period-ms "$period_ms" \
    --persisted true \
    --battery-not-low false \
    --network any

# network = any - only when have internet. For just ignoring internet state use
# "none"
