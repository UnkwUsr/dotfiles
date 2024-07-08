import os
from pathlib import Path

import pyconfig.redirectors as redir
# hack for being able to revert some options to "default" instead of just
# clearing them (for example list-like options)
from qutebrowser.config.config import instance as config_hack


def exec_config_subfiles(files):
    # change dir to config directory
    os.chdir(Path(__file__).parent)
    for f in files:
        exec(open(f).read())
    # restore after change dir
    os.chdir(Path.home())


exec_config_subfiles([
    "pyconfig/binds/_main.py"
    ])

c = c  # noqa: F821
config = config  # noqa: F821


redir.init_redirectors()
# workaround to make youtube redirector work
c.qt.workarounds.remove_service_workers = True

config.load_autoconfig(False)

# improve performance
c.qt.args = [
    "enable-gpu-rasterization", "enable-oop-rasterization",
    "ignore-gpu-blacklist", "enable-accelerated-video-decode"
]

c.session.lazy_restore = True
c.auto_save.session = True
c.session.default_name = "default"

# stub fix hangs on download popup:
# https://github.com/qutebrowser/qutebrowser/issues/8125
c.downloads.location.prompt = False

c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

c.content.autoplay = False
c.content.geolocation = False
c.content.notifications.enabled = False
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.register_protocol_handler = False
c.content.webrtc_ip_handling_policy = "disable-non-proxied-udp"

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

# allow clipboard access for some sites
config.set('content.javascript.clipboard', "access", 'github.com')
config.set('content.javascript.clipboard', "access", 'stackoverflow.com')

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = "black"

c.fonts.web.size.minimum = 17
c.fonts.default_size = "14pt"

c.completion.shrink = True
c.completion.height = "40%"

c.statusbar.widgets = ["search_match", "keypress", "url", "scroll", "progress", "tabs"]

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
    "ar": "https://wiki.archlinux.org/index.php/{}",
    "yt": "https://" + redir.YOUTUBE_REDIR + "/results?search_query={}",
    "w": "https://en.wikipedia.org/wiki/{}",
    "wr": "https://ru.wikipedia.org/wiki/{}",
    "gi": "https://github.com/search?q={}",
    "aur": "https://aur.archlinux.org/packages/?K={}&SB=v&SO=d",
    "dc": "https://docs.rs/{}",
    "dr": "https://doc.rust-lang.org/std/index.html?search={}",
    "hg": "https://hoogle.haskell.org/?hoogle={}",
}

c.completion.open_categories = ["history", "quickmarks"]

c.editor.command = [
    "st", "-c", "st_win", "vim", "-f", "{file}", "-c",
    "normal {line}G{column0}l"
]
