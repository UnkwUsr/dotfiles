# there is aliases/shortcuts for pacman

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
        | fzf -m --preview="less {2}" \
        | cut -d" " -f2 | tr '\n' ' ' \
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
