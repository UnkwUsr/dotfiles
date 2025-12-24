# vim: ft=i3config

# NOTE: get windows info with `swaymsg -t get_tree` and for x11 `xprop`

# highlight windows that are still x11
for_window [shell="xwayland"] title_format "%title [XWayland]"

## custom windows
# P.S. seems like it should go before other windows, because otherwise they
# take preference
for_window [class="^st_win$"] floating enable, sticky enable, resize set 640 480, move position center, border pixel 3
assign [class="^st_tmux$"] 2
assign [class="^tmux_noise_win$"] 4
assign [title="^arad$"] 9
assign [app_id="quteb-mpv"] 0
assign [app_id="music-mpv"] 7
assign [app_id="vifm-mpv"] 3

assign [app_id="org.qutebrowser.qutebrowser"] 1
assign [app_id="brave-browser"] 0
assign [app_id="discord"] 8
assign [app_id="org.telegram.desktop"] 10
assign [class="^chat-simplex-desktop-MainKt$"] 8
assign [app_id="org.qbittorrent.qBittorrent"] 4
assign [class="^Soffice$"] 3
assign [app_id="org.pwmt.zathura"] 3
assign [class="^SuperCollider$"] 3
assign [title="^ReZound$"] 3
assign [class="^Anki$"] 4
for_window [app_id="org.qutebrowser.qutebrowser"] border none
for_window [app_id="brave-browser"] border none
for_window [class="^Blender$"] border none
for_window [class="^feh$"] floating enable, move position center
for_window [app_id="org.pulseaudio.pavucontrol"] floating enable, sticky enable, resize set 1280 720, move position center
# xev
for_window [title="^Event Tester$"] floating enable, sticky enable

## games
assign [class="^hl_linux$"] 5
assign [class="^csgo_linux64$"] 5
assign [class="steam$"] 9
for_window [class="^Minecraft"] floating enable, move container to workspace 5
for_window [class="^ru-turikhay-tlauncher-bootstrap-Bootstrap$"] floating enable, move container to workspace 5
