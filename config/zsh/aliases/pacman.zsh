# there is aliases/shortcuts for pacman (and also aur helpers)

# packages search and info (remote and local)
alias pss='pacman -Ss'
alias psi='pacman -Si'
alias pqs='pacman -Qs'
alias pqi='pacman -Qi'
# find which package owns some file
alias pqo='pacman -Qo'

# list files owned by installed package
alias pql='pacman -Ql'
# fzf over files owned by installed packages
pqlf() {
    pacman -Ql $1 | grep -v "/$" \
        | fzf -m --preview="less {2}" \
        | cut -d" " -f2 | tr '\n' ' ' \
        | xargs -r vim
}
compdef -e 'words[1]=(pacman -Ql); service=pacman; (( CURRENT+=1 )); _pacman' pqlf

# search which packages (not only installed) owns some file
alias pfx='pacman -Fx'
# list all files owned by some package (not only installed)
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
alias pqr_unneeded='pacman -Qtdtq | pqr -'


#### aur section
alias pas="auracle search"
pai() { auracle show "$1" | less }
alias pan="yay -S"
alias pac="auracle clone"
# open in browser (takes completion from auracle clone)
pab() {
    quteb "https://aur.archlinux.org/packages/$1" & disown
}
compdef -e 'words[1]=(auracle clone); service=auracle; (( CURRENT+=1 )); _auracle' pab
