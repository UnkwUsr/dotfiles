#!/bin/bash
# Source: https://superuser.com/a/1784430/1660523
{
for i in "$@"; do
    echo -en "file://""$(realpath "${i}")""\n"
done
} | xclip -i -sel c -rmlastnl -t text/uri-list
