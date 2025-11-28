#!/bin/bash


# set screensaver timeout
xset s 1200 0
xset dpms 1200 0 0

# notifications daemon
dunst &

# clipboard daemon
wl-paste --type text --watch sh -c "$HOME/Projects/clipt/target/release/clipt put" &
# shellcheck disable=2016
wl-paste --type image --watch sh -c 'cat > ~/.local/share/rclip/image/png/"$(date +%s%N)"' &
{ cd ~/Projects/clipt/ && ./target/release/clipt server > /dev/null & }

# set initial monitor brightness
light -S 40 &

# hide cursor when typing or scrolling
xbanish -s &

# redshift, care about eyes at night. systemd autostart sometimes not work, so
# here it is
systemctl --user start redshift.service &

battery_low_monitor.sh &

# tracks stack of last active player, so pause/play them correspondingly
playerctld daemon &

keyd-application-mapper &

# auto run gather inbox
auto_gather_inbox.sh &
