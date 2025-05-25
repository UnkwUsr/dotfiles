require("user.plugins.gitsigns")
require("user.plugins.cmp")
require("user.plugins.null_ls")
require("user.plugins.zk")
require("user.plugins.lsp_status")
require("user.plugins.treesitter")
require("user.plugins.gx")
require("user.plugins.sniprun")
require("user.plugins.scnvim")

require("neodev").setup({})

require("flutter-tools").setup({
    lsp = {
        on_attach = require("user.lsp.on_attach"),
    },
})

-- replace maps from tpope's unimpaired
require("unimpaired").setup({
    keymaps = {
        previous_file = { mapping = "[f", dot_repeat = true },
        next_file = { mapping = "]f", dot_repeat = true },
    },
    default_keymaps = false,
})
