# vim: ft=i3config

# use i3lock to lock the screen before suspend.
# Also log (in system log) when screen lock started
exec --no-startup-id xss-lock --transfer-sleep-lock -- sh -c "logger i3lock locking screen && i3lock --nofork -c 000000"

# use dmenu as a program launcher
bindsym $mod+d exec --no-startup-id dmenu_run -fn 'Hack-11'

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        font pango:Hack, Font Awesome 6 Free 11
        status_command i3status-rs ~/.config/i3/status.toml

        position top
        colors {
            background #000000
        }
        tray_padding 0

        # Disable scrollings workspaces on mouse wheel
        bindsym button4 nop
        bindsym button5 nop
}


#### windows control

# kill focused window
bindsym $mod+Shift+q kill

## change windows display style
# change container layout (stacking (useless, removed), tabbed, toggle split)
bindsym $mod+w layout tabbed
bindsym $mod+shift+w layout stacking
bindsym $mod+e layout toggle split
# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle
# toggle tiling/floating
bindsym $mod+Shift+space floating toggle

# toggle sticky / non-sticky
bindsym $mod+$alt+space sticky toggle

# change focus
bindsym $mod+j focus left
bindsym $mod+h focus down
bindsym $mod+l focus up
bindsym $mod+k focus right
# change focus between tiling/floating windows
bindsym $mod+space focus mode_toggle

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+h move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+k move right

# switch to workspace
bindsym $mod+grave workspace "0"
bindsym $mod+1 workspace "1"
bindsym $mod+2 workspace "2"
bindsym $mod+3 workspace "3"
bindsym $mod+4 workspace "4"
bindsym $mod+5 workspace "5"
bindsym $mod+6 workspace "6"
bindsym $mod+7 workspace "7"
bindsym $mod+8 workspace "8"
bindsym $mod+9 workspace "9"
bindsym $mod+0 workspace "10"

# move focused container to workspace
bindsym $mod+Shift+grave move container to workspace "0"
bindsym $mod+Shift+1 move container to workspace "1"
bindsym $mod+Shift+2 move container to workspace "2"
bindsym $mod+Shift+3 move container to workspace "3"
bindsym $mod+Shift+4 move container to workspace "4"
bindsym $mod+Shift+5 move container to workspace "5"
bindsym $mod+Shift+6 move container to workspace "6"
bindsym $mod+Shift+7 move container to workspace "7"
bindsym $mod+Shift+8 move container to workspace "8"
bindsym $mod+Shift+9 move container to workspace "9"
bindsym $mod+Shift+0 move container to workspace "10"

# keys to resize window
bindsym $mod+r mode "resize"
mode "resize" {
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}
