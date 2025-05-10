#!/bin/bash
# Source: https://superuser.com/a/1784430/1660523
{
for i in "$@"; do
    i="$(realpath -s "$i")"

    # hack to trim sequence number in filenames of music and which is symlink
    if [[ "$PWD" == *"Files/annexes/music"* ]] && [ -h "$i" ]; then
        mkdir -p /tmp/cpfiles-messings
        newi="/tmp/cpfiles-messings/$(basename "$i" | cut -d' ' -f2-)"
        ln -sf "$i" "$newi"
        i="$newi"
    fi

    echo -en "file://${i}\n"
done
} | xclip -i -sel c -rmlastnl -t text/uri-list
