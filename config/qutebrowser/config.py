config.load_autoconfig(False)

c.session.lazy_restore = True
c.auto_save.session = True
c.session.default_name = "default"

c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

c.content.autoplay = False
config.set('content.autoplay', True, 'vk.com')
c.content.geolocation = False
c.content.notifications.enabled = False
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.register_protocol_handler = False

c.content.blocking.method = "both"
c.content.blocking.adblock.lists.append("https://easylist-downloads.adblockplus.org/advblock.txt")
c.content.blocking.adblock.lists.append("https://easylist-downloads.adblockplus.org/cntblock.txt")
c.content.blocking.hosts.lists.append("https://ewpratten.retrylife.ca/youtube_ad_blocklist/hosts.ipv4.txt")

# see more parameters we can block at https://github.com/qutebrowser/qutebrowser/issues/3648
config.set('content.javascript.enabled', False, 'stackoverflow.com')
config.set('content.javascript.enabled', False, 'www.google.com/search*')
# config.set('content.javascript.enabled', False, 'habr.com')
config.set('content.javascript.enabled', False, '*.archlinux.org')

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = "black"

c.fonts.web.size.minimum = 17

c.statusbar.widgets = ["keypress", "url", "scroll", "progress"]

c.tabs.mousewheel_switching = False
c.tabs.title.format = "{audio}{current_title}"
c.tabs.last_close = "blank"

c.window.hide_decoration = True
# c.qt.highdpi = True

c.downloads.location.suggestion = "filename"

# increase hints chars? now set only center row on keyboard (asdf...)
# c.hints.chars =

c.input.insert_mode.leave_on_load = True

c.search.wrap = False

c.spellcheck.languages = ["en-US", "ru-RU"]

c.url.searchengines["DEFAULT"] = "https://html.duckduckgo.com/html?q={}"
c.url.searchengines["g"] = "https://www.google.com/search?q={}"
c.url.searchengines["a"] = "https://wiki.archlinux.org/index.php/{}"
c.url.searchengines["w"] = "https://en.wikipedia.org/wiki/{}"
c.url.searchengines["wr"] = "https://ru.wikipedia.org/wiki/{}"
c.url.searchengines["gi"] = "https://github.com/search?q={}"
c.url.searchengines["aur"] = "https://aur.archlinux.org/packages/?K={}&SB=v&SO=d"
c.url.searchengines["c"] = "https://crates.io/crates/{}"
c.url.searchengines["dc"] = "https://docs.rs/{}"
c.url.searchengines["dr"] = "https://doc.rust-lang.org/std/index.html?search={}"

c.completion.open_categories = ["quickmarks", "history"]

c.editor.command = ["st", "vim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("<Ctrl+w>", "rl-backward-kill-word", mode='command')
config.bind("<Alt+Backspace>", "rl-unix-word-rubout", mode='command')
config.bind("<Ctrl+shift+e>", "edit-command", mode='command')

config.unbind('<Ctrl-v>', mode='normal')

config.bind("<ESC>", "clear-keychain ;; search ;; fullscreen --leave ;; clear-messages")

