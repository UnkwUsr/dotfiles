#!/bin/bash

# keyboard layout
#setxkbmap -layout "us,ru" -model pc104 -variant "winkeys" -option "grp:caps_toggle,grp_scroll:caps,terminate:ctrl_alt_bksp" &
setxkbmap -layout "us,ru" -model pc104 -variant "winkeys" -option "grp_led:scroll,grp:caps_toggle,terminate:ctrl_alt_bksp" &
# set repeat rate
xset r rate 400 50 &

# download and set wallpaper
url_wp=$(cat ~/.config/i3/url_wp)
set_wp="feh --no-fehbg --bg-scale $(realpath ~/.config/i3/wp.jpg)"
[ -f ~/.config/i3/wp.jpg ] && ($set_wp &) || ((echo "Downloading wallpaper" && wget -O ~/.config/i3/wp.jpg $url_wp && $set_wp) &)

# notifications
dunst &

# screenshots
flameshot &

# start clipboard tracking
gpaste-client start &

safeeyes &

