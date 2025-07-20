#!/bin/bash

CONFIG_FILE="$HOME/.config/yt-dlp/config"
mpv_options=()

# read the config line by line
while IFS= read -r line; do
    # skip comments (starts with #)
    if [[ "$line" =~ ^# ]]; then
        continue
    fi
    # skip empty lines
    if [[ "$line" =~ ^$ ]]; then
        continue
    fi

    # cut leading -- of parameter
    line="$(tail -c+3 <<<"$line")"

    if [[ "$line" != *=* ]]; then
        # if no '=' appeared, append it to the end of line
        line="$line="
    fi

    mpv_options+=("--ytdl-raw-options-append=$line")
done < "$CONFIG_FILE"

mpv "${mpv_options[@]}" "$@"
