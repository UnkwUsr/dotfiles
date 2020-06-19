#
# ~/.bashrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '

# make some colored and human-readable
alias ls='ls --color=auto -h --group-directories-first'
alias du='du -h'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'
alias dmesg='dmesg --color=auto'
alias diff='diff --color=auto'
export LESS=-R

# ls aliases
alias ll='ls -l'
alias la='ls -lA'

# make verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'

export EDITOR=vim


# fix bug not setting current working directory when its need for creating new terminal emulator window (like Ctrl+Shift+t in Termite)
. /etc/profile.d/vte.sh

# fix forward history search for C-s (C-r for reverse search)
stty -ixon

# history settings
# append immediately
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
# infinity history
HISTSIZE=-1
HISTFILESIZE=-1


if [ "$EUID" -ne 0 ]; then
    # not root
    PS1='\D{%I:%M:%S} [ \[\e[34;1m\]\w\[\e[m\] ]\[\e[33;1m\]\$\[\e[m\] '
else
    # root
    PS1='\[\e[1;30;40m\]\D{%I:%M:%S}\[\e[m\] [\[\e[31;1m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] \[\e[34;1m\]\w\[\e[m\] ]\[\e[31;1m\]\$ \[\e[m\]'
fi


# ALT-C for fuzzy-cd
# CTRL-R for fuzzy-history
# CTRL-T for fuzzy-completion
source /usr/share/fzf/key-bindings.bash
