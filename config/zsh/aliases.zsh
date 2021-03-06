#### just settings for some programs

# color and human-readable
alias pacman='pacman --color=auto'
alias dmesg='dmesg --color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto -h --group-directories-first'
alias du='du -h'
alias df='df -h -x tmpfs -x devtmpfs --output=source,size,avail,target'
alias ffmpeg='ffmpeg -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffprobe='ffprobe -hide_banner'

# verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'

# case-sensitivity method 'smart'
alias rg='rg -S'
# start week from Monday
alias cal='cal -m'


#### new commands

# ls shortcuts
alias ll='ls -l'
alias la='ls -lA'

# typos
alias l='ll'
alias lll='ll'
alias dc='cd'

# open file from dotfiles directory
alias sd='cd ~/.dotfiles && fzf --preview="bat {} --style changes --decorations always --color always" | xargs -r vim; cd - > /dev/null'
alias ds='sd'
# cd to directory of the file in dotfiles
alias sdd='cd ~/.dotfiles && cd $(dirname $(fzf)) && pwd'

# vim with gv plugin
alias gv='vim +:GV'
alias gva='vim +":GV --all"'


#### pacman

# packages search and info
alias pss='pacman -Ss'
alias psi='pacman -Si'
alias pqs='pacman -Qs'
alias pqi='pacman -Qi'
alias pqo='pacman -Qo'

# local files search
alias pql='pacman -Ql'
pqlf() {
    pacman -Ql $1 | fzf | cut -d" " -f2 | xargs -r vim
}

# packages files search
alias pfx='pacman -Fx'
alias pfl='pacman -Fl'
alias pfy='sudo pacman -Fy'

# upgrade all
alias syu='sudo pacman -Syu'

# install
alias pin='sudo pacman -S'

# remove
alias pqr='sudo pacman -Rnscu'
