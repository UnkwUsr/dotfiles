#!/bin/bash
cur_playlist="${HOME}/Files/annexes/music/.current_playlist"
last_num="$(cd "$cur_playlist" || exit && fd -tf -tl -d1 . | sort -n | tail -n1 | cut -d. -f1)"
for i in "$@"; do
    if [[ "$i" =~ ^.*\.(webm|mkv|mp4)$ ]]; then
        echo "error: you're trying to move non-music file"
        exit 2
    fi

    if [[ "$i" != *" - "* ]]; then
        echo "warning: artist name missed?"
        echo "filename is: $i"
        read -erp "Continue? [y/N] " ans
        if [[ "$ans" != [yY]* ]]; then
            exit 2
        fi
    fi

    newname="$(( last_num += 1 )). ${i}"
    mv "$i" "${cur_playlist}/${newname}"
done
