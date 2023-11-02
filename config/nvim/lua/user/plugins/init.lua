require("user.plugins.gitsigns")
require("user.plugins.cmp")
require("user.plugins.null_ls")
require("user.plugins.zk")
require("user.plugins.lsp_status")
require("user.plugins.treesitter")

require("neodev").setup({})
require("nvim-autopairs").setup({
    disable_filetype = { "lisp" },
})

require("flutter-tools").setup({
    lsp = {
        on_attach = require("user.lsp.on_attach"),
    },
})
