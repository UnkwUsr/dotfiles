import pyconfig.redirectors as redir

config = config  # noqa: F821

# reload config
config.bind("<Ctrl+r>", "config-source")

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
# move tab to the end
config.bind("9gm", "tab-move -1")
# copy url and title formatted
config.bind("ym", "yank inline '* {title}: {url}'")

# strip url parameters
config.bind("gs", "navigate strip")

config.bind("<Ctrl+w>", "rl-backward-kill-word", mode='command')
config.bind("<Alt+Backspace>", "rl-rubout ' '", mode='command')
config.bind("<Ctrl+shift+e>", "cmd-edit", mode='command')

config.unbind('<Ctrl-v>', mode='normal')
config.unbind('.', mode='normal')

config.bind(
    "<ESC>",
    "clear-keychain ;; search ;; fullscreen --leave ;; clear-messages")


# open in mpv (video player)
config.bind(",m", "spawn -vd mpv {url} --profile=quteb")
config.bind(",M", "hint links spawn -vd mpv {hint-url} --profile=quteb")
# open in mpv but play only audio
config.bind(",n", "spawn -vd mpv {url} --profile=quteb --no-vid")
config.bind(",N", "hint links spawn -vd mpv {hint-url} --profile=quteb --no-vid")
# open in vim. Special handle for github (blob -> raw)
config.bind(",e", "spawn -vd st-tm --focus \"vim \
                                        $(sed 's/\\/blob\\//\\/raw\\//' \
                                        <<<'{url}')\"")
# git clone current url
config.bind(",c", "spawn -vd st-tm --focus "
                  "\"mkdir -p /tmp/clowns && cd /tmp/clowns && "
                  "git clown $(cut -d'/' -f-5 <<<'{url}' | cut -d'?' -f1) && "
                  "cd \\\"$(basename \\\"$_\\\" .git)\\\" && pwd && ll\"")

# better yank with replaced youtube url
config.bind("yy", "spawn -d sh -c 'echo -n \"" + redir.yt_url_replaced + "\" | xclip -sel c' ;; message-info 'Yanked current url'")

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
    'yt-dlp -o \"%(album)s/%(artist)s - %(title)s.%(ext)s\" \"" + redir.yt_url_replaced + "\" || echo \"{url}\" >> bad_urls'")

# send current url to inbox
config.bind(",i", "spawn -vd sh -c 'echo -e \"* {title}\\n  * <" + redir.yt_url_replaced + ">\"\
                   >> ~/txts/inbox/quteb_saved_urls.md' ;; tab-close")

# enable/disable tor proxy
config.bind(
    "st", "set content.proxy socks://localhost:9050/ ;; \
    set colors.statusbar.normal.bg #000090")
config.bind(
    "sT", "set content.proxy system ;; \
    set colors.statusbar.normal.bg black")

# search site in web archive
config.bind("zs", "open -tr https://web.archive.org/web/*/{url}")
# open prompt to search in web archive
config.bind("zS", "cmd-set-text :open -tr https://web.archive.org/web/*/")
# save current url in web archive
config.bind("zd", "open -tr https://web.archive.org/save/{url}")

# toggle dark
config.bind("\\w", "config-cycle colors.webpage.darkmode.enabled false true")
