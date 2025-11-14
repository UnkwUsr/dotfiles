# media stuff like mpv, yt-dlp, etc

# cd into often used dirs
alias yt="cd ~/Files/Media/yt && pwd && ll"
alias mz="cd ~/Files/Media/mz && pwd && ll"
alias ms="cd ~/Files/annexes/music/ && pwd && ll"

# run mpv in background
mpb() { mpv --no-resume-playback --loop-playlist=inf --directory-mode=recursive --force-window=immediate --wayland-app-id=music-mpv "$@" & disown }
# play files in reverse order
mpbr() { fd -tl -tf -0 "$@" | sort -zr | xargs -0 mpv --no-resume-playback --loop-playlist=inf --force-window=immediate --wayland-app-id=music-mpv & disown }

# run mpv over files searched with fd. Here we call msb under the hood, where
# all the rest arguments are just passed to fd
alias mfd="msb ."


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
# helper for extracting youtube video id from file name
_yt_id_from_filename() { sed 's/^.*\[\(.*\)\]\..*/\1/g' <<<"$1" }
# apply yta on files already downloaded as videos
ytaf() {
    for filename in "$@"
    do
        yta -- "$(_yt_id_from_filename "$filename")"
    done
}
# download subs for file
ytsf() {
    for filename in "$@"
    do
        yt-dlp --embed-subs --sub-langs=en,ja --write-auto-subs -- "$(_yt_id_from_filename "$filename")"
    done
}
# download audio album/playlist, puts album tracks in separate folder
alias ytalbum='yta -o "%(uploader)s - %(playlist)s/%(playlist_index)s. %(title)s [%(id)s].%(ext)s"'


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
