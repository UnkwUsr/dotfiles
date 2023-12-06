#!/bin/bash

# set keyboard press repeat rate
xset r rate 400 50 &

# download and set wallpaper
url_wp=$(cat ~/.config/i3/url_wp)
set_wp="feh --no-fehbg --bg-scale $(realpath ~/.config/i3/wp.jpg)"
[ -f ~/.config/i3/wp.jpg ] && ($set_wp &) || ((echo "Downloading wallpaper" && curl $url_wp --output ~/.config/i3/wp.jpg -s && $set_wp) &)

# notifications daemon
dunst &

# clipboard daemon
rclip daemon > /dev/null &

# set initial monitor brightness
light -S 40 &

# hide cursor when typing or scrolling
xbanish -s

# redshift, care about eyes at night. systemd autostart sometimes not work, so
# here it is
systemctl --user start redshift.service &

# libreddit, self-hosted alternative frontend for reddit
docker run --rm -d --name libreddit -p 127.0.0.150:80:8080 libreddit/libreddit &
