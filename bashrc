#
# ~/.bashrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '

alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lA'
alias l1='ls -1'
alias lk='ls -ld $(ls --color=never)'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'
alias dmesg='dmesg --color=auto'

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
    PS1='\D{%I:%M:%S} [ \[\e[34;1m\]\w\[\e[m\] ]\[\e[33;1m\]\$\[\e[m\] '
else
    # root
    PS1='\[\e[1;30;40m\]\D{%I:%M:%S}\[\e[m\] [\[\e[31;1m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] \[\e[34;1m\]\w\[\e[m\] ]\[\e[31;1m\]\$ \[\e[m\]'
fi


export PATH="$HOME/.emacs.d/bin:$PATH"
