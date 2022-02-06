export EDITOR=vim
export BROWSER=quteb

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --type symlink'
export FZF_DEFAULT_OPTS="--bind ctrl-s:toggle-sort"

# xdg specification
export XDG_CONFIG_HOME=~/.config
# make docker follow xdg
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# path to cargo(rust) local installed programs
export PATH=$PATH:~/.cargo/bin
# path to my scripts
export PATH=$PATH:~/.bin

# automatic startx on tty1
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
      exec startx -- -keeptty &> ~/.xorg.log
fi
