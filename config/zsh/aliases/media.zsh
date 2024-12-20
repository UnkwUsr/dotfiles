# media stuff like mpv, yt-dlp, etc

# cd into often used dirs
alias yt="cd ~/Files/Media/yt && pwd && ll"
alias mz="cd ~/Files/Media/mz && pwd && ll"
alias ms="cd ~/Files/annexes/music/ && pwd && ll"

# run mpv in background
mpb() { mpv --loop-playlist=inf --directory-mode=recursive --force-window=immediate --x11-name=music-mpv "$@" & disown }


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


#### yt-dlp often used
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
# download album/playlist, puts album tracks in separate folder
alias ytalbum='yt-dlp -o "%(artist)s - %(playlist)s/%(video_autonumber)s. %(title)s [%(id)s].%(ext)s"'


#### yt-dlp download playlists
YF_PLAYLIST_FILENAME="playlist"
yfl() {
    yt-dlp "$(cat "$YF_PLAYLIST_FILENAME")" --flat-playlist -J \
        | jq '.entries[].title' \
        | nl -w 1 -s ' '
}
# download from playlist
yfi() {
    index="$1"
    format="%(playlist_index)s. %(title)s [%(id)s].%(ext)s"
    yt-dlp -o "$format" "$(cat "$YF_PLAYLIST_FILENAME")" -I "$index"
}
