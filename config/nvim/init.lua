-- shortcut for pretty print
P = vim.print

vim.cmd("source ~/.vimrc")

require("user.plugins")
require("user.lsp")
require("user.dotfiles_prefill_commit")
