# fmt: off
config = config; redir = redir  # noqa

# #### media

# open in mpv (video player)
config.bind(",m", "spawn -vd mpv {url} --profile=quteb")
config.bind(",M", "hint links spawn -vd mpv {hint-url} --profile=quteb")
# open in mpv but play only audio
config.bind(",n", "spawn -vd mpv {url} --profile=quteb --no-vid")
config.bind(",N", "hint links spawn -vd mpv {hint-url} --profile=quteb --no-vid")

# download video from current page
#
# why to use tmux here? I want to see progress and be able to stop downloading
# and/or modify command if something goes wrong (like use proxy)
config.bind(",z", "spawn -vd st-tm \
    'cd \"$HOME/Files/Media/yt/\"' \
    'yt-dlp \"" + redir.yt_url_replaced + "\" || echo \"{url}\" >> bad_urls'")
# download page as music album or youtube playlist. Put all in separate folder
config.bind(",a", "spawn -vd st-tm \
    'cd \"$HOME/Files/Media/yt/\"' \
    'yt-dlp -o \"%(album)s/%(artist)s - %(title)s.%(ext)s\" \"{url}\" || echo \"" + redir.yt_url_replaced + "\" >> bad_urls'")


# #### misc

# open in vim. Special handle for github (blob -> raw)
config.bind(",e", "spawn -vd st-tm --focus \"vim \
                                        $(sed 's/\\/blob\\//\\/raw\\//' \
                                        <<<'{url}')\"")
# git clone current url
config.bind(",c", "spawn -vd quteb-git-clown '{url}'")
# send current url to inbox
config.bind(",i", "spawn -vd sh -c 'echo -e \"* {title}\\n  * <" + redir.yt_url_replaced + ">\"\
                   >> ~/txts/inbox/quteb_saved_urls.md' ;; tab-close")
