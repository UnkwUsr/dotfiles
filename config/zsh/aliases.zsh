#### just settings for some programs

# color and human-readable
alias pacman='pacman --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
alias du='du -h'
alias df='df -h -x tmpfs -x devtmpfs --output=source,size,avail,target'
alias free='free -h'
alias ffmpeg='ffmpeg -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffprobe='ffprobe -hide_banner'
# also sort in ascii order
alias ls='LC_COLLATE=C ls --color=auto -h --group-directories-first'

# verbose
alias rm='rm -v'
alias chmod='chmod -v'
# also prompt on overwrite
alias cp='cp -vi'
alias mv='mv -vi'

# case-sensitivity method 'smart'
alias rg='rg -S'
# start week from Monday
alias cal='cal -m'

alias tokei='tokei --sort=lines'
alias auracle='auracle --sort=votes'


#### new commands

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


#### pacman

# packages search and info
alias pss='pacman -Ss'
alias psi='pacman -Si'
alias pqs='pacman -Qs'
alias pqi='pacman -Qi'
alias pqo='pacman -Qo'

# local files search
alias pql='pacman -Ql'
# fzf over local files
pqlf() {
    pacman -Ql $1 | grep -v "/$" \
        | fzf -m | cut -d" " -f2 | tr '\n' ' ' \
        | xargs -r vim
}
compdef -e 'words[1]=(pacman -Ql); service=pacman; (( CURRENT+=1 )); _pacman' pqlf

# packages files search
alias pfx='pacman -Fx'
alias pfl='pacman -Fl'
alias pfy='sudo pacman -Fy'

# upgrade all
alias syu='sudo pacman -Syu'

# install
alias pin='sudo pacman -S'
# install packages selected via fzf
alias pinf='pin $(pacman -Slq | \
    fzf -q "$1" -m --preview "pacman -Si {1}" --print0 | tr "\0" " ")'

# remove
alias pqr='sudo pacman -Rnscu'
