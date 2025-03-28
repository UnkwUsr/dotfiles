# fmt: off
config = config; redir = redir  # noqa

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
# move tab to the end
config.bind("9gm", "tab-move -1")
# copy url and title formatted
config.bind("ym", "yank inline '* {title}: {url}'")

# strip url parameters
config.bind("gs", "navigate strip")

config.bind("<Ctrl+w>", "rl-backward-kill-word", mode="command")
config.bind("<Alt+Backspace>", "rl-rubout ' '", mode="command")
config.bind("<Ctrl+shift+e>", "cmd-edit", mode="command")

config.unbind("<Ctrl-v>", mode="normal")
config.unbind(".", mode="normal")

config.bind("<ESC>", "clear-keychain ;; search ;; fullscreen --leave ;; clear-messages")
