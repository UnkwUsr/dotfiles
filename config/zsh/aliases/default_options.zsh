# there is aliases to set default options for some programs

# color and human-readable
alias pacman='pacman --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
alias du='du -h'
alias df='df -h -x tmpfs -x devtmpfs -x efivarfs --output=source,size,avail,target,fstype'
alias free='free -h'
alias ffmpeg='ffmpeg -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffprobe='ffprobe -hide_banner'
# also sort in ascii order
alias ls='LC_COLLATE=C ls --color=auto -h --group-directories-first'

# verbose
alias rm='rm -v'
alias chmod='chmod -v'
# verbose and prompt on overwrite
alias cp='cp -vi'
alias mv='mv -vi'
# verbose and remove parents
alias rmdir='rmdir -vp'

# case-sensitivity method 'smart'
alias rg='rg -S'
# start week from Monday
alias cal='cal -m'

alias tokei='tokei --sort=lines'
alias auracle='auracle --sort=votes'

alias readelf='readelf --wide --demangle'
