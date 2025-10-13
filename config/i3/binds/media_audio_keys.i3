# vim: ft=i3config

# control brightness (with fn keys)
bindsym XF86MonBrightnessUp  exec --no-startup-id "light -A 10 && dunstctl close && notify-send -t 500 'light' $(light)"
bindsym XF86MonBrightnessDown exec --no-startup-id "light -U 10 && dunstctl close && notify-send -t 500 'light' $(light)"

# media seek next/previous track
bindsym shift+XF86AudioRaiseVolume exec --no-startup-id "playerctl next"
bindsym shift+XF86AudioLowerVolume  exec --no-startup-id "playerctl previous"
# media seek back/forward in seconds
set $seek_show_notif sh -c "dunstctl close \
        && notify-send -t 750 \
            $(playerctl metadata -f '"{{xesam:title}}" "{{duration(position)}} / {{duration(mpris:length)}}"')"
bindsym Prior exec --no-startup-id playerctl position 5- && $seek_show_notif
bindsym Next exec --no-startup-id playerctl position 5+ && $seek_show_notif
bindsym shift+Prior exec --no-startup-id playerctl position 30- && $seek_show_notif
bindsym shift+Next exec --no-startup-id playerctl position 30+ && $seek_show_notif

# volume control
## adjust volume level
bindsym XF86AudioLowerVolume exec --no-startup-id "ponymix --sink decrease 5 > /dev/null"
bindsym XF86AudioRaiseVolume exec --no-startup-id "ponymix --sink increase 5 > /dev/null"
## toggle mute and pause playing media
bindsym Pause exec --no-startup-id "ponymix --sink toggle > /dev/null && playerctl -a pause"
## unmute and start play media
bindsym XF86AudioPlay exec --no-startup-id "ponymix --sink unmute > /dev/null && playerctl play"

# microphone
## adjust volume level
bindsym XF86KbdBrightnessDown exec --no-startup-id "ponymix --source decrease 5 > /dev/null"
bindsym XF86KbdBrightnessUp exec --no-startup-id "ponymix --source increase 5 > /dev/null"
## mute/unmute
bindsym XF86AudioMicMute exec --no-startup-id "ponymix --source mute > /dev/null"
bindsym XF86KbdLightOnOff exec --no-startup-id "ponymix --source unmute > /dev/null"

# dbvolume control
bindsym KP_Home exec --no-startup-id "dbvolume default"
bindsym Mod2+KP_7 exec --no-startup-id "dbvolume default"
bindsym KP_Up exec --no-startup-id "cat /tmp/dbvolume_level | wmenu | xargs dbvolume"
bindsym KP_Begin mode "dbvolume!"
mode "dbvolume!" {
    bindsym KP_Home exec --no-startup-id "dbvolume default"
    bindsym KP_Left exec --no-startup-id "dbvolume -10"
    bindsym KP_Right exec --no-startup-id "dbvolume +10"
    bindsym KP_Prior exec --no-startup-id "dbvolume 500"

    bindsym Escape mode "default"
    bindsym KP_Begin mode "default"
}
