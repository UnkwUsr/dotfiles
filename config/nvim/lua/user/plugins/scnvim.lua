local map = require("scnvim").map
-- local map_expr = require("scnvim").map_expr
require("scnvim").setup({
    keymaps = {
        ["<M-e>"] = map("editor.send_line", { "i", "n" }),
        ["<C-e>"] = {
            map("editor.send_block", { "i", "n" }),
            map("editor.send_selection", "x"),
        },
        ["<leader>sp"] = map("postwin.toggle", { "n", "i" }),
        ["<leader>sl"] = map("postwin.clear", { "n", "i" }),
        -- ["<C-k>"] = map("signature.show", { "n", "i" }),
        ["<leader>ss"] = map("sclang.hard_stop", { "n", "x", "i" }),
        ["<C-h>"] = map("sclang.hard_stop", { "n", "x", "i" }),
        ["<leader>st"] = map("sclang.start"),
        ["<leader>sk"] = map("sclang.recompile"),
        -- ["<F1>"] = map_expr("s.boot"),
        -- ["<F2>"] = map_expr("s.meter"),
    },
    editor = {
        highlight = {
            color = "IncSearch",
            type = "flash",
            flash = {
                duration = 100,
                repeats = 1,
            },
        },
    },
    postwin = {
        float = {
            enabled = true,
        },
    },
})
