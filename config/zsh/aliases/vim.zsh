# open vim recent files history (with fzf)
alias vh='vim +":History"'
# open vim recent file
alias vo='vim +":exe \"normal \<C-o>\""'

# helper alias, open all files one per line in vim
alias all_open_in_vim='xargs -d "\n" -r vim'
# open vim with files selected via fzf
alias vf='fzf -m | all_open_in_vim'
# fd filename search for files and open them in vim
vfd() { fd -tf "$@" | all_open_in_vim }
# rg full-text search for files and open them in vim
vrg() { rgf "$@" | all_open_in_vim +"/$1" }


#### with a spice of git

# just helper to detect if we are in git repo. Exit zero (ok) if in git,
# otherwise non-zero (error)
alias are-we-git="git rev-parse --is-inside-work-tree > /dev/null"

# vim with gv plugin, shows git log
gv() { are-we-git && vim +":GV $*" +":tabclose 2" +":nmap <buffer> q :q<CR>" }
gva() { gv "--all $*" }
# show commits from HEAD to $1 (or "origin" by default)
gvd() { gv "${1:-'origin/master'}"~..HEAD "${@:2}"}

compdef -e 'words[1]=(git log); service=git; (( CURRENT+=1 )); _git' gv gva
# Source: https://stackoverflow.com/questions/27226716/custom-zsh-completion-for-a-function-based-on-default-arguments

# vim fzf over git changed files
alias vfl='are-we-git && vim +":GFiles?"'
