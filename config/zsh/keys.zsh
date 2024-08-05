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
source /usr/share/fzf/key-bindings.zsh 2> /dev/null || source <(fzf --zsh)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"
bindkey "^T" fzf-cd-widget
bindkey "^[c" fzf-file-widget
# restore CTRL-R rebinded by fzf (I use improved bind on ALT-R)
bindkey "^R" history-incremental-search-backward
# ALT-T for fzf tab completion (by Aloxaf/fzf-tab plugin)
bindkey "^[t" fzf-tab-complete
# restore TAB rebinded by Aloxaf/fzf-tab
bindkey "^I" expand-or-complete

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
# ALT-R for fuzzy-all-history
bindkey '^[r' fzf-all-history-widget


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
