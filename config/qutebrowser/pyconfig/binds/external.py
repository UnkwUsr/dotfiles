# fmt: off
config = config; redir = redir  # noqa

# #### media

# open in mpv (video player)
config.bind(",m", "spawn -vd mpv {url} --profile=quteb")
config.bind(",M", "hint links spawn -vd mpv {hint-url} --profile=quteb")
# open in mpv but play only audio
config.bind(",n", "spawn -vd mpv {url} --profile=quteb --no-vid")
config.bind(",N", "hint links spawn -vd mpv {hint-url} --profile=quteb --no-vid")

# why to use tmux here? Because I want to see progress and be able stop
# downloading and/or modify command if something goes wrong (like use proxy)
#
# download video from current page
config.bind(",z", "spawn -vd st-tm \
    'cd \"$HOME/Files/Media/yt/\"' \
    'yt-dlp \"" + redir.yt_url_replaced + "\" || echo \"{url}\" >> bad_urls'")
# download page as music album
config.bind(",a", "spawn -vd st-tm \
    'cd \"$HOME/Files/Media/yt/\"' \
    'ytalbum \"" + redir.yt_url_replaced + "\" || echo \"{url}\" >> bad_urls'")


# #### misc

# open in vim. Special handle for github (blob -> raw)
config.bind(",e", "spawn -vd st-tm --focus \"vim \
                                        $(sed 's/\\/blob\\//\\/raw\\//' \
                                        <<<'{url}')\"")
# open link in vim appending .diff to it. This makes github and gitlab
# pull/merge requests appear as usual raw diff
config.bind(",d", "spawn -vd st-tm --focus \"vim '{url}.diff'\"")

# git clone current url
config.bind(",c", "spawn -vd quteb-git-clown '{url}'")
# send current url to inbox
config.bind(",i", "spawn -vd sh -c 'echo -e \"* {title}\\n  * <" + redir.yt_url_replaced + ">\"\
                   >> ~/txts/inbox/quteb_saved_urls.md' ;; tab-close")
