#### zsh settings

### history

HISTFILE=~/.local/share/zsh_history
HISTSIZE=1000
SAVEHIST=1000000

# append new history entries to file immediately
setopt INC_APPEND_HISTORY

# ignore duplicates
setopt HIST_IGNORE_ALL_DUPS

# ignore commands starts with space
setopt HIST_IGNORE_SPACE


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
# but allow creating files if not exist with `>>`
setopt APPEND_CREATE


### prompt

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    from_ssh="termux"
fi
PS1="${from_ssh}%# "
RPS1="%(?..[%?%1v])"

# prepend distrobox container name
PS1="${CONTAINER_ID}${PS1}"

# clear right-side prompt on pressing enter
setopt TRANSIENT_RPROMPT
