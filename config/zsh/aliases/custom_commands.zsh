# just aliases, shortcuts for some things

# ls shortcuts
alias ll='ls -l'
alias la='ls -lA'

# ripgrep shortcuts
alias rgf='rg --count'

# typos
alias l='ll'
alias lll='ll'
alias dc='cd'

# open file from dotfiles directory
alias sd='cd ~/.dotfiles && fzf \
    --preview="bat {} --style changes --decorations always --color always" \
    | xargs -r vim; cd - > /dev/null'
# cd to directory of the file in dotfiles
alias sdd='cd ~/.dotfiles && cd $(dirname $(fzf)) && pwd'

# vim with gv plugin, shows git log
gv() {
    git rev-parse --is-inside-work-tree > /dev/null && \
        vim +":GV $*" +":tabclose 2" +":nmap <buffer> q :q<CR>"
}
gva() { gv "--all $*" }
compdef -e 'words[1]=(git log); service=git; (( CURRENT+=1 )); _git' gv gva
# Source: https://stackoverflow.com/questions/27226716/custom-zsh-completion-for-a-function-based-on-default-arguments

# file browser
alias fm='vifm'

# open vim recent files history (with fzf)
alias vh='vim +":History"'
# open vim recent file
alias vo='vim +":exe \"normal \<C-o>\""'
# vim open files selected via fzf
alias vf='vim $(fzf -m)'
# vim fzf over git changed files
alias vfl='vim +":GFiles?"'
# fd search for files and open them in vim
vfd() {
    vim $(fd -tf "$@")
}
