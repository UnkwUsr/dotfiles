# aliases
# make colored and human-readable
alias ls='ls --color=auto -h --group-directories-first'
alias du='du -h'
alias df='df -h -x tmpfs -x devtmpfs --output=source,size,avail,target'
alias pacman='pacman --color=auto'
alias dmesg='dmesg --color=auto'
alias diff='diff --color=auto'
alias ffmpeg='ffmpeg -hide_banner'
alias ffplay='ffplay -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias cal='cal -m'
# make verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'
# set rg case-sensitivity method 'smart'
alias rg='rg -S'
# useful aliases
# (for detail see parameters descriptions in man pages of each program)
alias ll='ls -l'
alias la='ls -lA'

# typos
alias l='ll'
alias lll='ll'
alias dc='cd'

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
# append history entries immediately
# (also immediately import new commands from history file)
# setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
# ignore duplicates
setopt HIST_IGNORE_ALL_DUPS

# clear right-side prompt on pressing enter
setopt TRANSIENT_RPROMPT

# emacs-like navigation in prompt line
bindkey -e

# open editor with current command by pressing Ctrl+x Ctrl+e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# make C-w (and friends) consider symbol '/'
WORDCHARS=${WORDCHARS/\/}

# alt+backspace to delete WORD (consider only whitespaces)
bindkey '^[^?' backward-kill-whitespace
autoload -z select-word-style
backward-kill-whitespace() {
    select-word-style whitespace
    zle backward-kill-word
    select-word-style normal
}
zle -N backward-kill-whitespace

fpath+=~/.zfunc
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# rehash before each completion
zstyle ':completion:*' rehash true

# disable treating `!` character
# (so now can use '!' for excluding in globs)
unsetopt BANG_HIST

# load plugins from antibody plugin manager
# Note: need run
# `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh`
# after changing .zsh_plugins.txt
source ~/.zsh_plugins.sh

# fzf stuff
# ALT-C for fuzzy-cd
# CTRL-R for fuzzy-history
# ALT-R for fuzzy-all-history
# CTRL-T for fuzzy-completion
# ALT-T for fuzzy-file-select
source /usr/share/fzf/key-bindings.zsh
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"

bindkey "^T" fzf-tab-complete
bindkey "^I" complete-word
bindkey "^[t" fzf-file-widget

fzf-all-history-widget() {
    _HISTFILE=$HISTFILE
    fc -p
    ORIG_HIST_SIZE=HISTSIZE
    HISTSIZE=1000000000000
    fc -R $_HISTFILE

    zle fzf-history-widget

    HISTSIZE=ORIG_HIST_SIZE
    fc -P
}
zle     -N   fzf-all-history-widget
bindkey '^[r' fzf-all-history-widget


# prompt
PS1="%# "
RPS1="%(?..[%?%1v])"
