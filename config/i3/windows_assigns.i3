# vim: ft=i3config

# Note: to search windows criterias use `xprop`

assign [class="^qutebrowser$"] 1
assign [class="^Brave-browser$"] 0
assign [class="^discord$"] 8
assign [class="^TelegramDesktop$"] 10
assign [class="^chat-simplex-desktop-MainKt$"] 8
assign [class="^Soffice$"] 3
assign [class="^Zathura$"] 3
assign [title="^ReZound$"] 3
assign [class="^Anki$"] 4
for_window [class="^qutebrowser$"] border none
for_window [class="^Brave-browser$"] border none
for_window [class="^Blender$"] border none
for_window [class="^feh$"] floating enable, move position center
for_window [class="^Peek$"] floating enable, resize set 640 480, move position center
for_window [class="^Pavucontrol$"] floating enable, sticky enable, resize set 1280 720, move position center
# xev
for_window [title="^Event Tester$"] floating enable, sticky enable

## custom windows
for_window [class="^st_win$"] floating enable, sticky enable, resize set 640 480, move position center, border pixel 3
assign [class="^st_tmux$"] 2
assign [class="^tmux_noise_win$"] 4
assign [title="^arad$"] 9
assign [instance="^quteb-mpv$"] 0
assign [instance="^music-mpv$"] 7
assign [instance="^vifm-mpv$"] 3

## games
assign [class="^hl_linux$"] 5
assign [class="^csgo_linux64$"] 5
assign [class="steam$"] 9
for_window [class="^Minecraft"] floating enable, move container to workspace 5
for_window [class="^ru-turikhay-tlauncher-bootstrap-Bootstrap$"] floating enable, move container to workspace 5
