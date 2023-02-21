require("nvim-treesitter.configs").setup({
    ensure_installed = { "comment", "regex" },

    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },

    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            -- set to `false` to disable one of the mappings
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})
