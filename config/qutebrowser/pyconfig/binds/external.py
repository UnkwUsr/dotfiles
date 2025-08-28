# fmt: off
config = config; redir = redir  # noqa

# #### media

# open in mpv (video player)
# TODO: make this shortcut safe in the way that it write erroneus urls to file,
# similar to download shortcut
config.bind(",m", "spawn -vd sh -c 'mpv-with-yt-dlp.sh --profile=quteb \"" + redir.yt_url_replaced + "\"'")  # noqa

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
                   >> ~/txts/dtm/00_quteb_saved_urls.md' ;; tab-close")
