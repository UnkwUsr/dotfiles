# vim: ft=i3config

# make screenshot
bindsym Print exec QT_SCALE_FACTOR=0.5 flameshot gui
# start screen recording (video + audio)
bindsym $mod+bracketright exec \
    bash -c "exec -a me_screen_rec wl-screenrec \
        --audio --audio-device "@DEFAULT_MONITOR@" \
        -f \"screen_$(date +%Y_%m_%d_%H-%M_%N).mp4\" &" \
    && exec -a me_screen_rec_tray python <(echo -e "from PyQt6.QtWidgets import QApplication, QSystemTrayIcon \nfrom PyQt6.QtGui import QIcon \napp = QApplication([]) \nQSystemTrayIcon(QIcon(\\"/usr/share/icons/Adwaita/scalable/devices/camera-web.svg\\"), app).show() \napp.exec()")
bindsym $mod+ctrl+bracketright exec pkill -f me_screen_rec && pkill -f me_screen_rec_tray

# lock screen
bindsym $mod+i exec swayidle -w \
            timeout 1 '$lock && swaymsg "output * power off"' \
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
