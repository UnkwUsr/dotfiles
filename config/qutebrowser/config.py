import pyconfig.redirectors as redir

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
c.content.blocking.adblock.lists.clear()
c.content.blocking.adblock.lists.append(
    "https://easylist-downloads.adblockplus.org/advblock.txt")
c.content.blocking.adblock.lists.append(
    "https://easylist-downloads.adblockplus.org/cntblock.txt")

c.content.user_stylesheets.clear()
c.content.user_stylesheets.append("~/.config/qutebrowser/styles.css")

# see more parameters we can block at
# https://github.com/qutebrowser/qutebrowser/issues/3648
config.set('content.javascript.enabled', False, 'stackoverflow.com')
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

c.input.insert_mode.leave_on_load = True

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

c.completion.open_categories = ["quickmarks", "history"]

c.editor.command = [
    "st", "-c", "st_win", "vim", "-f", "{file}", "-c",
    "normal {line}G{column0}l"
]

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
# move tab to the end
config.bind("9gm", "tab-move -1")

config.bind("<Ctrl+w>", "rl-backward-kill-word", mode='command')
config.bind("<Alt+Backspace>", "rl-rubout ' '", mode='command')
config.bind("<Ctrl+shift+e>", "edit-command", mode='command')

config.unbind('<Ctrl-v>', mode='normal')

config.bind(
    "<ESC>",
    "clear-keychain ;; search ;; fullscreen --leave ;; clear-messages")


# open in video player
config.bind(",m", "spawn -vd mpv {url} --profile=quteb")
config.bind(",M", "hint media spawn -vd mpv {hint-url} --profile=quteb")

# enable/disable tor proxy
config.bind(
    "st", "set content.proxy socks://localhost:9050/ ;; \
    set colors.statusbar.normal.bg #000090")
config.bind(
    "sT", "set content.proxy system ;; \
    set colors.statusbar.normal.bg black")

# search site in web archive
config.bind("zs", "open -tr https://web.archive.org/web/*/{url}")

# workaround to make youtube redirector work
c.qt.workarounds.remove_service_workers = True
