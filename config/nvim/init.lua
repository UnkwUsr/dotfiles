-- shortcut for pretty print
function P(a)
    print(vim.inspect(a))
    return a
end

vim.cmd("source ~/.vimrc")

require("user.plugins")
require("user.lsp")
require("user.dotfiles_prefill_commit")
