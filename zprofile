# editor
export EDITOR=vim
# path to cargo(rust) local installed programs
export PATH=$PATH:~/.cargo/bin
# path to my scripts
export PATH=$PATH:~/.bin

# automatic startx on tty1
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
      exec startx -- -keeptty &> ~/.xorg.log
fi