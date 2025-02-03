# just aliases, shortcuts for some things

# ls shortcuts
alias ll='ls -l'
alias la='ls -lA'

# typos
alias l='ll'
alias lll='ll'
alias dc='cd'

# shortcuts
alias fm='vifm'
alias an="git annex"
# show my ip and location
alias myip='curl -s https://api.ip.sb/geoip -A Mozilla | jq'
# list current open connections
alias cons='lsof -i'
# show files with matches
alias rgf='rg --files-with-matches'
# cd to root of git repo
alias cdg='_t=$(git rev-parse --show-toplevel) && cd "$_t" && pwd'

# open lisp repl
alias sbcl="rlwrap sbcl --noinform"
# execute lisp script
alias sbcls="sbcl --script"


#### dotfiles managing

# open file from dotfiles directory
alias sd='cd ~/.dotfiles && fzf \
    --preview="bat {} --style changes --decorations always --color always" \
    | xargs -r vim; cd - > /dev/null'
# cd to directory of the file in dotfiles
alias sdd='cd ~/.dotfiles && cd "$(dirname "$(fzf)")" && pwd'
# fv over dotfiles (files full-text search)
alias sdf='cd ~/.dotfiles && fv'


#### misc

# rmdir everything possible
alias rmd="rmdir */ 2>/dev/null"

# move all from another folder to current one and remove empty folder then
flatdir() {
    if [ -z "$1" ]; then
        echo "Usage: $0 [dir]"
        return 1
    fi

    mv "$1"/* ./
    rmdir "$1"
}

# paste image from x-clipboard to a file
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

# pandoc with my config (to quickly get pdf file)
mepan() { pandoc -d ~/.config/pandoc/me.yaml "$1" -o "$1.pdf" }
# open in zathura pdf of pandoc-rendered markdown
zpan() {
    name="/tmp/rendered_$1_$(date +%s).pdf"
    pandoc -d ~/.config/pandoc/me.yaml "$1" -o "$name" \
        && (zathura "$name" && rm "$name" > /dev/null) & disown
}

# open rclip image history by date in fzf
rimga() {
    img_dir="$HOME/.local/share/rclip/image/png"
    file_pick=$(ls -1 "$img_dir" \
        | awk '{print $1, strftime("%F %R", substr($1, 1, length($1)-3))}' \
        | fzf --tac --with-nth 2.. | cut -d' ' -f1)
    feh --start-at "$img_dir/$file_pick" & disown
}
