#### zsh settings

### history

HISTFILE=~/.local/share/zsh_history
HISTSIZE=1000
SAVEHIST=100000

# append new history entries to file immediately
setopt INC_APPEND_HISTORY

# ignore duplicates
setopt HIST_IGNORE_ALL_DUPS


### completion

# rehash on each completion
zstyle ':completion:*' rehash true

# completion sources
fpath+=~/.zfunc

# P.S. this sould be before aliases.zsh as there I do compdef's
# The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
# End of lines added by compinstall


### other

# disable treating `!` character
# (so now we can use '!' for excluding in globs)
unsetopt BANG_HIST

# do not overwrite existing files with `>`
setopt NOCLOBBER


### prompt

# clear right-side prompt on pressing enter
setopt TRANSIENT_RPROMPT

# colorize prompt input text
PS1="%# %B%F{white}"
RPS1="%F{default}%(?..[%?%1v])"
preexec () { echo -ne "\e[0m" }