# just aliases, shortcuts for some things

# ls shortcuts
alias ll='ls -l'
alias la='ls -lA'

# typos
alias l='ll'
alias lll='ll'
alias dc='cd'

# file browser
alias fm='vifm'

# show files with matches
alias rgf='rg --count'


#### vim+git

# just helper to detect if we are in git repo. Exit zero (ok) if in git,
# otherwise non-zero (error)
alias are-we-git="git rev-parse --is-inside-work-tree > /dev/null"

# vim with gv plugin, shows git log
gv() {
    are-we-git && vim +":GV $*" +":tabclose 2" +":nmap <buffer> q :q<CR>"
}
gva() { gv "--all $*" }
compdef -e 'words[1]=(git log); service=git; (( CURRENT+=1 )); _git' gv gva
# Source: https://stackoverflow.com/questions/27226716/custom-zsh-completion-for-a-function-based-on-default-arguments

# vim fzf over git changed files
alias vfl='are-we-git && vim +":GFiles?"'


#### vim

# open vim recent files history (with fzf)
alias vh='vim +":History"'
# open vim recent file
alias vo='vim +":exe \"normal \<C-o>\""'

# open vim with files selected via fzf
alias vf='vim $(fzf -m)'
# fd search for files and open them in vim
vfd() { vim $(fd -tf "$@") }


#### dotfiles managing

# open file from dotfiles directory
alias sd='cd ~/.dotfiles && fzf \
    --preview="bat {} --style changes --decorations always --color always" \
    | xargs -r vim; cd - > /dev/null'
# cd to directory of the file in dotfiles
alias sdd='cd ~/.dotfiles && cd $(dirname $(fzf)) && pwd'


#### misc

# show my ip and location
alias myip='curl -s https://api.ip.sb/geoip -A Mozilla | jq'

# move all from another folder to current one and remove empty folder then
flatdir() {
    mv "$1"/* ./
    rmdir "$1"
}
