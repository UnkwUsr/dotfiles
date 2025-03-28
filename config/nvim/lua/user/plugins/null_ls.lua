-- actually now it is none-ls, forked from null-ls. They just did not renamed
-- module
local null_ls = require("null-ls")

null_ls.setup({
    on_attach = require("user.lsp.on_attach"),
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.pg_format.with({
            filetypes = { "mysql", "sql" },
        }),
    },
})
