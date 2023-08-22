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

# run mpv in background
mpb() { mpv --loop-playlist=inf --force-window=immediate "$@" & disown }

# show files with matches
alias rgf='rg --files-with-matches'

# download audio-only with yt-dlp
alias yta="yt-dlp --embed-thumbnail --extract-audio --format=bestaudio"
# apply yta on files already downloaded as videos
ytaf() {
    for filename in "$@"
    do
        yta $(sed 's/^.*\[\(.*\)\]\..*/\1/g' <(<<<${filename}))
    done
}


#### vim+git

# just helper to detect if we are in git repo. Exit zero (ok) if in git,
# otherwise non-zero (error)
alias are-we-git="git rev-parse --is-inside-work-tree > /dev/null"

# vim with gv plugin, shows git log
gv() {
    are-we-git && vim +":GV $*" +":tabclose 2" +":nmap <buffer> q :q<CR>"
}
gva() { gv "--all $*" }
# show commits from HEAD to $1 (or "origin" by default)
gvd() { gv "${1:-origin}"~..HEAD "${@:2}"}

compdef -e 'words[1]=(git log); service=git; (( CURRENT+=1 )); _git' gv gva
# Source: https://stackoverflow.com/questions/27226716/custom-zsh-completion-for-a-function-based-on-default-arguments

# vim fzf over git changed files
alias vfl='are-we-git && vim +":GFiles?"'

# cd to root of git repo
alias cdg='_t=$(git rev-parse --show-toplevel) && cd "$_t" && pwd'


#### vim

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
vrg() { rgf "$@" | all_open_in_vim }


#### dotfiles managing

# open file from dotfiles directory
alias sd='cd ~/.dotfiles && fzf \
    --preview="bat {} --style changes --decorations always --color always" \
    | xargs -r vim; cd - > /dev/null'
# cd to directory of the file in dotfiles
alias sdd='cd ~/.dotfiles && cd "$(dirname "$(fzf)")" && pwd'


#### misc

# show my ip and location
alias myip='curl -s https://api.ip.sb/geoip -A Mozilla | jq'
# list current open connections
alias cons='lsof -i'

# move all from another folder to current one and remove empty folder then
flatdir() {
    mv "$1"/* ./
    rmdir "$1"
}

# write image from x-clipboard to a file
# name: I couldn't think of a name for this, so there it is...
aas() {
    if [ $# -eq 0 ]; then
        imgfilename=$(mktemp -u ./XXX.png)
    else
        imgfilename="$1.png"
    fi

    xclip -sel c -o -t image/png > "$imgfilename" || return 1
    echo "$imgfilename"
}

# open lisp repl
alias sbcl="rlwrap sbcl --noinform"
# execute lisp script
alias sbcls="sbcl --script"
