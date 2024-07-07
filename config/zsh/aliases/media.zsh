# this is media combusting stuff shit yea mpv yt-dlp etc

# cd into often used dirs
alias yt="cd ~/Files/Media/yt && pwd && ll"
alias mz="cd ~/Files/Media/mz && pwd && ll"
alias ms="cd ~/Files/annexes/music/ && pwd && ll"

# play all music in shuffled order
alias msb="cd ~/Files/music/ \
    && fd -tl -tf --exec-batch \
    mpv --force-window=yes \
    --input-commands=playlist-shuffle,playlist-next & disown"

# run mpv in background
mpb() { mpv --loop-playlist=inf --force-window=immediate "$@" & disown }


#### mpv history
# mpv whole history
# '+args\ %' is a hack to suppress 'E173: 1 more file to edit' warning
alias mha='vim +args\ % ~/.config/mpv/history ~/.config/mpv/history_radio'
# mpv history for specific day (today by default)
# optionally takes 1 argument, number of days offset (to the past)
# P.S. it opens 2 files: main history and radio history
mh() {
    offset=${1:=0}
    date=$(date +'%F' -d "-$offset day -3 hours")

    from_file() {
        awk '/^'$date' /,/*/' "$1" | split_much_delta
    }

    vim +'bufdo set noreadonly | buffer 1' \
        <(from_file ~/.config/mpv/history) \
        <(from_file ~/.config/mpv/history_radio)
}


#### yt-dlp often used shit
# download audio-only with yt-dlp
alias yta="yt-dlp --embed-thumbnail --extract-audio --format=bestaudio"
# download with tor proxy
alias yttor="yt-dlp --proxy 'socks://localhost:9050/'"
alias ytator="yta --proxy 'socks://localhost:9050/'"
# apply yta on files already downloaded as videos
ytaf() {
    for filename in "$@"
    do
        yta -- "$(sed 's/^.*\[\(.*\)\]\..*/\1/g' <<<"$filename")"
    done
}


#### yt-dlp download playlists
# TODO: think I can make general playlist file name and void arguments here
# list playlist
yfl() {
    for filename in "$@"; do
        yt-dlp "$(cat "$filename")" --flat-playlist -J \
            | jq '.entries[].title' \
            | nl -w 1 -s ' '
    done
}
# download from playlist
yfi() {
    filename="$1"
    index="$2"
    yt-dlp "$(cat "$filename")" -I "$index"
}
