# aliases
# make colored and human-readable
alias ls='ls --color=auto -h --group-directories-first'
alias du='du -h'
alias pacman='pacman --color=auto'
alias dmesg='dmesg --color=auto'
alias diff='diff --color=auto'
alias diff='diff --color=auto'
# make verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'
# useful aliases
# (for detail see parameters descriptions in man pages of each program)
alias ll='ls -l'
alias la='ls -lA'
alias da='du -sc'
# set programs default parameters
# set rg case-sensitivity method 'smart'
alias rg='rg -S'

# exports
# editor
export EDITOR=vim
# path to cargo(rust) local installed programs
export PATH=$PATH:~/.cargo/bin


# history settings
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
# append history entries immediately
# (also immediately import new commands from history file)
setopt SHARE_HISTORY

# TODO: WHAT IS IT? (added automatically by zsh-newuser-install)
bindkey -e

# TODO: not tested yet
# pipe stdin to program less if not set manually
# READNULLCMD=less

# The following lines were added by compinstall
zstyle :compinstall filename '/home/menuser/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

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
# CTRL-T for fuzzy-completion
# ALT-T for fuzzy-file-select
source /usr/share/fzf/key-bindings.zsh
# more speed with fd
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"
bindkey "^T" fzf-tab-complete
bindkey "^I" complete-word
bindkey "^[t" fzf-file-widget

# shell prompt
eval "$(starship init zsh)"
