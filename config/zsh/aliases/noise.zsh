# fast tidal start
alias tidalstart="jack_control start && sclang && jack_control stop"


#### mpv for noise performance

# play in mpv with noise profile
mpz() { clear; exec mpv --profile=noise "$1" }
# play all tracks each in separate tmux window
mpt() {
    for file in "$@"
    do
        tmux new-window -d "mpv --profile=noise \"$file\""
    done
}
# play N times all mentioned tracks (each in separate tmux window)
mpn() {
    for i in $(seq $1)
    do
        mpt "${@:2}"
    done
}
