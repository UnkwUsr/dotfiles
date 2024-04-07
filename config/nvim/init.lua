-- shortcut for pretty print
function P(a)
    print(vim.inspect(a))
    return a
end

vim.cmd("source ~/.config/nvim/plugins.vim")
vim.cmd("source ~/.config/nvim/options.vim")
vim.cmd("source ~/.config/nvim/maps.vim")
vim.cmd("source ~/.config/nvim/autocmd.vim")

vim.cmd("source ~/.config/nvim/txts.vim")

require("user.plugins")
require("user.lsp")

require("user.dotfiles_prefill_commit")
require("user.gcfx")
require("user.sticky_floating_windows")
