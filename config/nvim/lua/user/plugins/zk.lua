-- add `:ZkOrphans` command
require("zk.commands").add("ZkOrphans", function(options)
    options = vim.tbl_extend("force", { orphan = true }, options or {})
    require("zk").edit(options, { title = "Zk Orphans" })
end)

local function map_keys(bufnr)
    local function keymap(mode, key, cmd)
        local opts = { noremap = true, silent = false }
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
    end

    -- stylua: ignore start
    -- create notes
    keymap("n", "<leader>zn", "<Cmd>ZkNew<CR>")
    keymap("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>")

    -- search notes
    keymap("n", "<leader>zs", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
    keymap("v", "<leader>zs", ":'<,'>ZkMatch<CR>")

    -- links/backlinks
    keymap("n", "<leader>zl", "<Cmd>ZkLinks<CR>")
    keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>")

    -- orphans
    keymap("n", "<leader>zo", "<Cmd>ZkOrphans<CR>")
    -- stylua: ignore end
end

require("zk").setup({
    picker = "fzf",
    lsp = {
        config = {
            on_attach = function(client, bufnr)
                require("user.lsp.on_attach")(client, bufnr)

                map_keys(bufnr)
            end,
        },
    },
})
