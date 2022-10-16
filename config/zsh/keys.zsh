# emacs-like navigation in prompt line
bindkey -e

# disable ctrl-s which freezes terminal
stty stop undef

# make C-w (and friends) consider symbols '/' and '|'
# (for default behavior see next alt+backspace bind)
WORDCHARS=${WORDCHARS/\//|}

# alt+backspace to delete a WORD
# (consider only whitespaces (like default C-w))
bindkey '^[^?' backward-kill-whitespace
autoload -z select-word-style
backward-kill-whitespace() {
    select-word-style whitespace
    zle backward-kill-word
    select-word-style normal
}
zle -N backward-kill-whitespace

# Ctrl+x Ctrl+e to open editor with the current command
bindkey "^X^E" edit-command-line
autoload -z edit-command-line
zle -N edit-command-line


#### fzf

# ALT-C for fuzzy-cd
# CTRL-R for fuzzy-history
source /usr/share/fzf/key-bindings.zsh
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"

# disable Aloxaf/fzf-tab plugin to retore tab to default completion mechanism
# (I bind this plugin to key CTRL-T)
disable-fzf-tab

# CTRL-T for fuzzy-tab-completion (by Aloxaf/fzf-tab plugin)
bindkey "^T" fzf-tab-complete
# ALT-T for fuzzy-file-select
bindkey "^[t" fzf-file-widget
# ALT-R for fuzzy-all-history
bindkey '^[r' fzf-all-history-widget

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
zle -N fzf-all-history-widget


#### custom

# ctrl+j to run command but leave prompt untouched
# source: https://gist.github.com/knu/10d113c5093ba101d57c
bindkey '^j' run-line
run-line () {
  emulate -L zsh
  local buffer=$BUFFER
  zle push-line
  BUFFER=$buffer
  zle accept-line
}
zle -N run-line
