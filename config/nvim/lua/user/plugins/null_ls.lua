local null_ls = require("null-ls")

null_ls.setup({
    on_attach = require("user.lsp.on_attach"),
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.deno_fmt.with({
            filetypes = {
                "javascript",
                "json",
                -- "markdown",
                "typescript",
            },

            generator_opts = {
                command = "deno",
                args = { "fmt", "--options-indent-width", "4", "-" },
                to_stdin = true,
            },
        }),
        null_ls.builtins.formatting.pg_format.with({
            filetypes = { "mysql", "sql" },
        }),
    },
})
