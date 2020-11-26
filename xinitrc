# load Xresources
xrdb -merge ~/.Xresources
# load XKeyboard config
xkbcomp ~/.config/xkb/config :0 -w 0

# window manager
exec i3
