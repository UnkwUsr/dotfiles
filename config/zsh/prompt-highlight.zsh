# load plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# adjust colors
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
# for more see
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md

# optimize /mnt/
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/mnt)
