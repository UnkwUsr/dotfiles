# vim: ft=i3config

# Note: for findind key names use `xev` tool

# helper to run st window with command
set $st_win_with st -c st_win -e zsh -c

# start/focus a terminal with tmux and create new tmux pane
bindsym $mod+Return workspace 2; exec st-tm --focus
# start just a terminal
bindsym $alt+Return exec st

include ~/.config/i3/binds/media_audio_keys.i3
include ~/.config/i3/binds/translate.i3
include ~/.config/i3/binds/note_taking.i3
include ~/.config/i3/binds/misc.i3
