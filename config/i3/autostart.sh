#!/bin/bash

# set keyboard press repeat rate
xset r rate 400 50 &

# set screensaver timeout
xset dpms 1200 1200 1200

# set random wallpaper
# feh --no-fehbg --bg-scale "$(fd -tf . ~/.config/i3/wallpapers/ | shuf | head -n1)"
feh --no-fehbg --bg-scale ~/.config/i3/wallpapers/04_Miku_v2.png

# notifications daemon
dunst &

# clipboard daemon
rclip daemon > /dev/null &

# set initial monitor brightness
light -S 40 &

# hide cursor when typing or scrolling
xbanish -s &

# redshift, care about eyes at night. systemd autostart sometimes not work, so
# here it is
systemctl --user start redshift.service &

# tracks stack of last active player, so pause/play them correspondingly
playerctld daemon &
