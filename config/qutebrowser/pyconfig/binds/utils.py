# fmt: off
config = config; redir = redir  # noqa

# reload config
config.bind("<Ctrl+r>", "config-source")

# toggle dark mode
config.bind("\\w", "config-cycle colors.webpage.darkmode.enabled false true")

# toggle Tor/proxy
config.bind(
    "st", "set content.proxy socks://localhost:9050/ ;; \
    set colors.statusbar.normal.bg #000090")
config.bind(
    "sT", "set content.proxy system ;; \
    set colors.statusbar.normal.bg black")
config.bind(
    "se", "set content.proxy socks://localhost:45230/ ;; \
    set colors.statusbar.normal.bg #900090")

# search site in web archive
config.bind("zs", "open -tr https://web.archive.org/web/*/{url}")
# open prompt to search in web archive
config.bind("zS", "cmd-set-text :open -tr https://web.archive.org/web/*/")
# save current url in web archive
config.bind("zd", "open -tr https://web.archive.org/save/{url}")

# strip url parameters
config.bind("gs", "navigate strip")
