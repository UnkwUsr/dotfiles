# vim: ft=i3config

# make screenshot
bindsym Print exec --no-startup-id "flameshot gui"
# start video screen recording (video)
bindsym $mod+bracketright exec simplescreenrecorder --start-hidden --start-recording
# stop screen recording (patch required: https://github.com/MaartenBaert/ssr/pull/960)
bindsym $mod+ctrl+bracketright exec pkill -x simplescreenrec

# lock screen
bindsym $mod+i exec --no-startup-id "sleep 0.25 && xset dpms force suspend"
bindsym $mod+shift+i exec --no-startup-id "sleep 0.25 && systemctl suspend"

# clipboard manager
bindsym $mod+o exec $st_win_with 'rclip_copy'
bindsym $mod+shift+o exec $st_win_with 'rclip_rm'

# rofi calc
bindsym $mod+c exec rofi -dpi 1 -show calc -modi calc -no-show-match -no-sort -no-history -hint-welcome '' | awk -F "= " '{printf $NF}' | xclip -selection clipboard
bindsym $mod+$alt+c exec rofi -dpi 1 -show calc -modi calc -no-show-match -no-sort -hint-welcome '' | awk -F "= " '{printf $NF}' | xclip -selection clipboard

# run htop
bindsym $mod+m exec $st_win_with 'TERM=xterm htop'

# open list of running dalarma's
bindsym $mod+a exec $st_win_with "fdalarma"

# close all notifies
bindsym ctrl+shift+space exec "dunstctl close-all"

# when wanting to see video and do other things simultaneously
# P.S. size for vim for 80 width lines: 900 600
bindsym $mod+shift+p floating enable, sticky enable, resize set 640 480, move position center
