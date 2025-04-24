-- they are installed by default, disabling them
local disabled_parsers =
    { "markdown", "markdown_inline", "bash", "c", "python", "vimdoc" }

require("nvim-treesitter.configs").setup({
    ensure_installed = { "comment", "regex", "json" },

    highlight = {
        enable = true,
        disable = disabled_parsers,
    },
    indent = {
        enable = true,
        disable = disabled_parsers,
    },

    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gnr",
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            -- set to `false` to disable one of the mappings
            init_selection = "<c-d>",
            node_incremental = "<c-d>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-a>",
        },
    },
})
