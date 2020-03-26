#
# ~/.bashrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '

alias ls='ls --color=always'
alias la='ls -A'
alias ll='ls -lA'
alias grep='grep --color=always'
alias pacman='pacman --color=always'
alias dmesg='dmesg --color=always'

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'

export LESS=-R

export EDITOR=vim


# fix bug not setting current working directory when its need for creating new terminal emulator window (like Ctrl+Shift+t in Termite)
. /etc/profile.d/vte.sh


if [ "$EUID" -ne 0 ]; then
    # not root
    PS1='[ \[\033[34;1m\]\w\[\033[m\] ]\[\033[33;1m\]\$ \[\033[m\]'
else
    # root
    PS1='[\[\033[31;1m\]\u\[\033[m\]@\[\033[36m\]\h\[\033[m\] \[\033[34;1m\]\w\[\033[m\] ]\[\033[31;1m\]\$ \[\033[m\]'
fi
