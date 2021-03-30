# config.load_autoconfig(False)
config.load_autoconfig(True)

c.session.lazy_restore = True
c.auto_save.session = True

c.content.autoplay = False
c.content.geolocation = False
c.content.notifications = False
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.blocking.method = "adblock"
c.content.blocking.adblock.lists.append("https://easylist-downloads.adblockplus.org/advblock.txt")
c.content.blocking.adblock.lists.append("https://easylist-downloads.adblockplus.org/cntblock.txt")

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = "black"

c.fonts.web.size.minimum = 17

c.statusbar.widgets = ["keypress", "url", "scroll", "progress"]

c.tabs.mousewheel_switching = False
c.tabs.title.format = "{audio}{current_title}"

c.window.hide_decoration = True
# c.qt.highdpi = True

c.downloads.location.suggestion = "filename"

# increase hints chars? now set only center row on keyboard (asdf...)
# c.hints.chars =

c.input.insert_mode.leave_on_load = True

c.search.wrap = False

# c.spellcheck.languages.append("en-GB")
# c.spellcheck.languages.append("ru-RU")

c.url.searchengines["g"] = "https://www.google.com/search?q={}"
c.url.searchengines["t"] = "https://translate.google.com/?sl=en&tl=ru&text={}&op=translate"
c.url.searchengines["a"] = "https://wiki.archlinux.org/index.php/{}"
c.url.searchengines["w"] = "https://en.wikipedia.org/wiki/{}"
c.url.searchengines["wr"] = "https://ru.wikipedia.org/wiki/{}"
c.url.searchengines["gi"] = "https://github.com/search?q={}"

c.completion.open_categories = ["quickmarks", "bookmarks", "history", "filesystem"]

c.editor.command = ["st", "vim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("<Ctrl+w>", "rl-backward-kill-word", mode='command')
config.bind("<Alt+Backspace>", "rl-unix-word-rubout", mode='command')
config.unbind('<Ctrl-v>', mode='normal')

config.bind("T", "set-cmd-text -s :tab-focus")
