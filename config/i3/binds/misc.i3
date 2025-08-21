# vim: ft=i3config

# make screenshot
bindsym Print exec --no-startup-id "flameshot gui"
# annotate (like draw big red arrows) without freezing image
bindsym shift+Print exec --no-startup-id xcompmgr \
                & flameshot_do_not_freeze gui --region all \
                && pkill xcompmgr
# start screen recording (video + audio)
bindsym $mod+bracketright exec \
    bash -c "exec -a me_screen_rec ffmpeg -video_size 1920x1080 -framerate 30 \
        -f x11grab -i $DISPLAY -f pulse -i default -c:a aac -c:v libx264rgb -crf 0 \
        -preset ultrafast -color_range 2 \"screen_$(date +%Y_%m_%d_%H-%M_%N).mp4\" &" \
    && bash -c "exec -a me_screen_rec_tray yad --notification --image camera-web &"
bindsym $mod+ctrl+bracketright exec pkill -f me_screen_rec && pkill -f me_screen_rec_tray

# lock screen
bindsym $mod+i exec swayidle -w \
            timeout 1 'swaylock -f -c 000000 && swaymsg "output * power off"' \
            resume 'swaymsg "output * dpms on "; pkill -nx swayidle'
bindsym $mod+shift+i exec --no-startup-id "sleep 0.25 && systemctl suspend"

# clipboard manager
bindsym $mod+o exec $st_win_with '~/Projects/rclip/usr/share/rclip/fzf_pick.sh pick 1000'
bindsym $mod+p exec $st_win_with '~/Projects/rclip/usr/share/rclip/fzf_pick.sh pick'
bindsym $mod+shift+o exec $st_win_with '~/Projects/rclip/usr/share/rclip/fzf_pick.sh rm'
bindsym $mod+ctrl+o exec ~/Projects/rclip/usr/bin/copy.sh image

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

# bindsym $mod+$alt+c exec warpd --normal
# bindsym $alt+x exec warpd --grid
bindsym $alt+x exec warpd --normal
# bindsym $alt+z exec warpd --hint
