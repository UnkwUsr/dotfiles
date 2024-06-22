# vim: ft=i3config

# Note: for findind key names use `xev` tool

# helper for run st window with command
set $st_win_with st -c st_win -e zsh -c

# make screenshot
bindsym Print exec --no-startup-id "flameshot gui"

# clipboard manager
# bindsym $mod+o exec $st_win_with 'rclip_copy'
# bindsym $mod+shift+o exec $st_win_with 'rclip_rm'
bindsym $mod+o exec $st_win_with '~/Projects/rclip/usr/share/rclip/fzf_pick.sh pick 1000'
bindsym $mod+p exec $st_win_with '~/Projects/rclip/usr/share/rclip/fzf_pick.sh pick'
bindsym $mod+shift+o exec $st_win_with '~/Projects/rclip/usr/share/rclip/fzf_pick.sh rm'
bindsym $mod+ctrl+o exec ~/Projects/rclip/usr/bin/copy.sh image

# note taker
## dmenu
bindsym $mod+n exec --no-startup-id set -o pipefail && echo -n | dmenu -fn "Hack-11" -p "Note:" | head -c -1 > /tmp/text_to_copy && \
            (echo -n "* from dmenu copy: " && cat /tmp/text_to_copy && echo) >> ~/txts/dtm/inbox/00_inboxed.md && \
            [ -s /tmp/text_to_copy ] && \
            (xclip -sel c /tmp/text_to_copy && \
             rm /tmp/text_to_copy)
## xprompt (it has IME support, for Japanese)
bindsym $mod+shift+n exec --no-startup-id set -o pipefail && echo -n | xprompt </dev/null | head -c -1 > /tmp/text_to_copy && \
            (echo -n "* from xprompt copy: " && cat /tmp/text_to_copy && echo) >> ~/txts/dtm/inbox/00_inboxed.md && \
            [ -s /tmp/text_to_copy ] && \
            (xclip -sel c /tmp/text_to_copy && \
             rm /tmp/text_to_copy)
## edit current clipboard content with vim
bindsym $mod+$alt+n exec --no-startup-id (xclip -sel c -o > /tmp/text_to_copy || touch /tmp/text_to_copy) && \
            $st_win_with 'vim +set\ shortmess+=I +set\ binary +set\ noeol +set\ spell /tmp/text_to_copy' && \
            xclip -sel c /tmp/text_to_copy && \
            rm /tmp/text_to_copy

# rofi calc
bindsym $mod+c exec rofi -dpi 1 -show calc -modi calc -no-show-match -no-sort -no-history -hint-welcome '' | awk -F "= " '{printf $NF}' | xclip -selection clipboard
bindsym $mod+$alt+c exec rofi -dpi 1 -show calc -modi calc -no-show-match -no-sort -hint-welcome '' | awk -F "= " '{printf $NF}' | xclip -selection clipboard

# close all notifies
bindsym ctrl+shift+space exec "dunstctl close-all"

# buy list
bindsym $mod+b exec echo -n | dmenu -p "buy:" | cat <(echo -n "* ") - >> ~/txts/synced-inbox/buy.md \
                && notify-send "buy" -t 1000 "created" \
                || notify-send "buy" -u critical -t 2000 "can't create"
# dtm inbox
bindsym $mod+s exec echo -n | dmenu -p "dtm inbox:" \
            | ifne sh -c '(echo -n "* " && cat) >> ~/txts/dtm/inbox/00_inboxed.md'
# voice record inbox (this is *those key fn under F1*. idk why so)
bindsym $mod+F1 exec $st_win_with "inb_rec_mic"

# translate tool
set $trans_run trans -i /tmp/trans_text -view -show-original=no \
    -show-translation-phonetics=yes -show-prompt-message=no \
    -show-languages=no -show-alternatives=yes -show-original-dictionary=yes
## translate text from dmenu from en to ru or ru to en
## to repeat last translate just leave dmenu prompt empty and press enter
set $trans_get_dmenu_input (set -o pipefail && \
    inp=$(echo -n | dmenu -fn "Hack-11" -p "trans:" | head -c -1) && \
    (test -z "$inp" || echo "$inp" > /tmp/trans_text))
# input with xprompt which supports IME (for Japanese)
set $trans_get_ime_input (set -o pipefail && \
    inp=$(xprompt < /dev/null) && \
    (test -z "$inp" || echo "$inp" > /tmp/trans_text))
bindsym $mod+t exec $trans_get_dmenu_input && $st_win_with '$trans_run :ru'
bindsym $mod+shift+t exec $trans_get_dmenu_input && $st_win_with '$trans_run ru:en'
bindsym $mod+shift+f exec $trans_get_dmenu_input && $st_win_with '$trans_run ru:uk'
bindsym $mod+shift+g exec $trans_get_dmenu_input && $st_win_with '$trans_run :ja'
# from japanese to english (input with IME support)
bindsym $mod+g exec $trans_get_ime_input && $st_win_with '$trans_run ja:en'
## translate text from "primary selection" from any language to ru or en
set $trans_get_primary xclip -o -sel primary | tr '\n' ' ' > /tmp/trans_text
bindsym $mod+ctrl+t exec $trans_get_primary && $st_win_with '$trans_run :ru'
bindsym $mod+ctrl+shift+t exec $trans_get_primary && $st_win_with '$trans_run :en'
bindsym $mod+ctrl+f exec $trans_get_primary && $st_win_with '$trans_run :uk'
bindsym $mod+ctrl+g exec $trans_get_primary && $st_win_with '$trans_run :ja'
## edit previous translated text with vim
bindsym $mod+$alt+t exec $st_win_with 'vim +set\ shortmess+=I +set\ binary +set\ noeol +set\ spell /tmp/trans_text'

# start screen recording
bindsym $mod+bracketright exec simplescreenrecorder --start-hidden --start-recording
# stop recording (patch required: https://github.com/MaartenBaert/ssr/pull/960)
bindsym $mod+ctrl+bracketright exec pkill -x simplescreenrec

# run htop
bindsym $mod+m exec $st_win_with 'TERM=xterm htop'

# open list of running dalarma's
bindsym $mod+a exec $st_win_with "fdalarma"

# lock screen
bindsym $mod+i exec --no-startup-id "sleep 0.25 && xset dpms force suspend"
bindsym $mod+shift+i exec --no-startup-id "sleep 0.25 && systemctl suspend"

# fn keys

# control brightness
bindsym XF86MonBrightnessUp  exec --no-startup-id "light -A 10 && dunstctl close && notify-send -t 500 'light' $(light)"
bindsym XF86MonBrightnessDown exec --no-startup-id "light -U 10 && dunstctl close && notify-send -t 500 'light' $(light)"

# media playback (using playerctl)
bindsym XF86AudioNext exec --no-startup-id "playerctl next"
bindsym XF86AudioPrev exec --no-startup-id "playerctl previous"

# volume control
## adjust volume level
bindsym KP_Multiply exec --no-startup-id "ponymix --sink decrease 5 > /dev/null"
bindsym KP_Subtract exec --no-startup-id "ponymix --sink increase 5 > /dev/null"
## toggle mute and pause playing media
bindsym KP_Divide exec --no-startup-id "ponymix --sink toggle > /dev/null && playerctl -a pause"
## unmute and start play media
bindsym End exec --no-startup-id "ponymix --sink unmute > /dev/null && playerctl play"

# microphone
## adjust volume level
bindsym $alt+KP_Insert exec --no-startup-id "ponymix --source decrease 5 > /dev/null"
bindsym $alt+KP_Delete exec --no-startup-id "ponymix --source increase 5 > /dev/null"
## mute/unmute
bindsym KP_Insert exec --no-startup-id "ponymix --source mute > /dev/null"
bindsym KP_Delete exec --no-startup-id "ponymix --source unmute > /dev/null"
## (all the same but for enabled num lock)
bindsym Mod2+KP_0 exec --no-startup-id "ponymix --source mute > /dev/null"
bindsym Mod2+KP_Decimal exec --no-startup-id "ponymix --source unmute > /dev/null"
bindsym Mod2+$alt+KP_0 exec --no-startup-id "ponymix --source decrease 5 > /dev/null"
bindsym Mod2+$alt+KP_Decimal exec --no-startup-id "ponymix --source increase 5 > /dev/null"

# dbvolume control
bindsym KP_Home exec --no-startup-id "dbvolume default"
bindsym Mod2+KP_7 exec --no-startup-id "dbvolume default"
bindsym KP_Up exec --no-startup-id "cat /tmp/dbvolume_level | dmenu | xargs dbvolume"
bindsym KP_Begin mode "dbvolume!"
mode "dbvolume!" {
    bindsym KP_Home exec --no-startup-id "dbvolume default"
    bindsym KP_Left exec --no-startup-id "dbvolume -10"
    bindsym KP_Right exec --no-startup-id "dbvolume +10"
    bindsym KP_Prior exec --no-startup-id "dbvolume 500"

    bindsym Escape mode "default"
    bindsym KP_Begin mode "default"
}


# when wanting to see video and do other things simultaneously
# P.S. size for vim for 80 width lines: 900 600
bindsym $mod+shift+p floating enable, sticky enable, resize set 640 480, move position center
