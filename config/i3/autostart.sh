#!/bin/bash

# set keyboard press repeat rate
xset r rate 400 50 &

# set random wallpaper
feh --no-fehbg --bg-scale "$(fd -tf . ~/.config/i3/wallpapers/ | shuf | head -n1)"

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

# libreddit, self-hosted alternative frontend for reddit
# run this once:
# sudo systemctl enable docker.service
# docker run -d --restart unless-stopped --name libreddit -p 127.0.0.150:80:8080 libreddit/libreddit &
