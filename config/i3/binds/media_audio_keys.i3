# vim: ft=i3config

# control brightness (with fn keys)
bindsym XF86MonBrightnessUp  exec --no-startup-id "light -A 10 && dunstctl close && notify-send -t 500 'light' $(light)"
bindsym XF86MonBrightnessDown exec --no-startup-id "light -U 10 && dunstctl close && notify-send -t 500 'light' $(light)"

# media playback (using playerctl)
bindsym XF86AudioNext exec --no-startup-id "playerctl next"
bindsym XF86AudioPrev exec --no-startup-id "playerctl previous"
# media seek back/forward in seconds
set $seek_show_notif sh -c "dunstctl close \
        && notify-send -t 750 \
            $(playerctl metadata -f '"{{xesam:title}}" "{{duration(position)}} / {{duration(mpris:length)}}"')"
bindsym Prior exec --no-startup-id playerctl position 5- && $seek_show_notif
bindsym Next exec --no-startup-id playerctl position 5+ && $seek_show_notif
bindsym shift+Prior exec --no-startup-id playerctl position 10- && $seek_show_notif
bindsym shift+Next exec --no-startup-id playerctl position 10+ && $seek_show_notif
bindsym $alt+Prior exec --no-startup-id playerctl position 30- && $seek_show_notif
bindsym $alt+Next exec --no-startup-id playerctl position 30+ && $seek_show_notif

# volume control
## adjust volume level
bindsym KP_Multiply exec --no-startup-id "ponymix --sink decrease 5 > /dev/null"
bindsym XF86AudioLowerVolume exec --no-startup-id "ponymix --sink decrease 5 > /dev/null"
bindsym KP_Subtract exec --no-startup-id "ponymix --sink increase 5 > /dev/null"
bindsym XF86AudioRaiseVolume exec --no-startup-id "ponymix --sink increase 5 > /dev/null"
## toggle mute and pause playing media
bindsym KP_Divide exec --no-startup-id "ponymix --sink toggle > /dev/null && playerctl -a pause"
## unmute and start play media
bindsym XF86AudioPlay exec --no-startup-id "ponymix --sink unmute > /dev/null && playerctl play"

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
