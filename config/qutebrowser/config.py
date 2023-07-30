import pyconfig.redirectors as redir

# hack for being able to revert some options to "default" instead of just
# clearing them (for example list-like options)
from qutebrowser.config.config import instance as config_hack

c = c  # noqa: F821
config = config  # noqa: F821

config.load_autoconfig(False)

# improve performance
c.qt.args = [
    "enable-gpu-rasterization", "enable-oop-rasterization",
    "ignore-gpu-blacklist", "enable-accelerated-video-decode"
]

c.session.lazy_restore = True
c.auto_save.session = True
c.session.default_name = "default"

c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

c.content.autoplay = False
c.content.geolocation = False
c.content.notifications.enabled = False
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.register_protocol_handler = False

c.content.blocking.method = "both"
config_hack.unset("content.blocking.adblock.lists")
c.content.blocking.adblock.lists.append(
    "https://easylist-downloads.adblockplus.org/advblock.txt")
c.content.blocking.adblock.lists.append(
    "https://easylist-downloads.adblockplus.org/cntblock.txt")

config_hack.unset("content.user_stylesheets")
c.content.user_stylesheets.append("~/.config/qutebrowser/styles.css")

# see more parameters we can block at
# https://github.com/qutebrowser/qutebrowser/issues/3648
config.set('content.javascript.enabled', False, 'www.google.com/search*')
# config.set('content.javascript.enabled', False, 'habr.com')
config.set('content.javascript.enabled', False, '*.archlinux.org')

# allow clipboard access for some sites
config.set('content.javascript.can_access_clipboard', True, 'github.com')

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = "black"

c.fonts.web.size.minimum = 17

c.completion.shrink = True
c.completion.height = "40%"

c.statusbar.widgets = ["keypress", "url", "scroll", "progress"]

c.tabs.mousewheel_switching = False
c.tabs.title.format = "{audio}{current_title}"
c.tabs.last_close = "blank"
# open new tabs at the beginning of the list
c.tabs.new_position.unrelated = "first"

c.window.hide_decoration = True
# c.qt.highdpi = True

c.downloads.location.suggestion = "filename"

c.search.wrap = False

c.spellcheck.languages = ["en-US", "ru-RU"]

c.url.searchengines = {
    "DEFAULT": "https://html.duckduckgo.com/html?q={}",
    "g": "https://www.google.com/search?q={}",
    "a": "https://wiki.archlinux.org/index.php/{}",
    "yt": "https://" + redir.YOUTUBE_REDIR + "/results?search_query={}",
    "w": "https://en.wikipedia.org/wiki/{}",
    "wr": "https://ru.wikipedia.org/wiki/{}",
    "gi": "https://github.com/search?q={}",
    "aur": "https://aur.archlinux.org/packages/?K={}&SB=v&SO=d",
    "dc": "https://docs.rs/{}",
    "dr": "https://doc.rust-lang.org/std/index.html?search={}"
}

c.completion.open_categories = ["history", "quickmarks"]

c.editor.command = [
    "st", "-c", "st_win", "vim", "-f", "{file}", "-c",
    "normal {line}G{column0}l"
]

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
# move tab to the end
config.bind("9gm", "tab-move -1")
# copy url and title formatted
config.bind("ym", "yank inline '* {title}: {url}'")

config.bind("<Ctrl+w>", "rl-backward-kill-word", mode='command')
config.bind("<Alt+Backspace>", "rl-rubout ' '", mode='command')
config.bind("<Ctrl+shift+e>", "edit-command", mode='command')

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
config.bind(",N", "hint links spawn -vd mpv {hint-url} --profile=quteb --no-vid")  # noqa: E501

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
config.bind("zS", "set-cmd-text :open -tr https://web.archive.org/web/*/")

# workaround to make youtube redirector work
c.qt.workarounds.remove_service_workers = True
