# from /etc/X11/xinit/xinitrc
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# load Xresources
xrdb -merge ~/.Xresources
# load XKeyboard config
xkbcomp ~/.config/xkb/config :0 -w 0

# window manager
exec i3
