# vim: ft=i3config

# input text that will be copied to clipboard
## with dmenu
bindsym $mod+n exec --no-startup-id set -o pipefail && echo -n | dmenu -fn "Hack-11" -p "Note:" | head -c -1 > /tmp/text_to_copy && \
            (echo -n "* from dmenu copy: " && cat /tmp/text_to_copy && echo) >> ~/txts/dtm/inbox/00_inboxed.md && \
            [ -s /tmp/text_to_copy ] && \
            (xclip -sel c /tmp/text_to_copy && \
             rm /tmp/text_to_copy)
## with xprompt (it has IME support, for Japanese)
bindsym $mod+shift+n exec --no-startup-id set -o pipefail && echo -n | xprompt </dev/null | head -c -1 > /tmp/text_to_copy && \
            (echo -n "* from xprompt copy: " && cat /tmp/text_to_copy && echo) >> ~/txts/dtm/inbox/00_inboxed.md && \
            [ -s /tmp/text_to_copy ] && \
            (xclip -sel c /tmp/text_to_copy && \
             rm /tmp/text_to_copy)
# edit current clipboard content with vim
bindsym $mod+$alt+n exec --no-startup-id (xclip -sel c -o > /tmp/text_to_copy || touch /tmp/text_to_copy) && \
            $st_win_with 'vim +set\ shortmess+=I +set\ binary +set\ noeol +set\ spell /tmp/text_to_copy' && \
            xclip -sel c /tmp/text_to_copy && \
            rm /tmp/text_to_copy

# buy list
bindsym $mod+b exec echo -n | dmenu -p "buy:" | cat <(echo -n "* ") - >> ~/txts/synced-inbox/buy.md \
                && notify-send "buy" -t 1000 "created" \
                || notify-send "buy" -u critical -t 2000 "can't create"
# dtm inbox
bindsym $mod+s exec (echo -n | dmenu -p "dtm inbox:" \
                && notify-send -t 500 dtm-inbox "saved in dtm inbox" \
                || notify-send "dtm-inbox" -u critical -t 5000 "not sent") \
            | ifne sh -c '(echo -n "* " && cat) >> ~/txts/dtm/inbox/00_inboxed.md' \

# voice record inbox (this is *those key fn under F1*. idk why so)
bindsym $mod+F1 exec $st_win_with "inb_rec_mic"
bindsym $mod+Tab exec $st_win_with "inb_rec_mic"
