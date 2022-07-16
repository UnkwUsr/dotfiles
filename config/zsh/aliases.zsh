# make colored and human-readable
alias ls='ls --color=auto -h --group-directories-first'
alias du='du -h'
alias df='df -h -x tmpfs -x devtmpfs --output=source,size,avail,target'
alias pacman='pacman --color=auto'
alias dmesg='dmesg --color=auto'
alias diff='diff --color=auto'
alias ffmpeg='ffmpeg -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias cal='cal -m'
# make verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'
# set rg case-sensitivity method 'smart'
alias rg='rg -S'

# ls shortcuts
alias ll='ls -l'
alias la='ls -lA'
# vim with gv plugin
alias gv='vim +:GV'
alias gva='vim +":GV --all"'

# typos
alias l='ll'
alias lll='ll'
alias dc='cd'
