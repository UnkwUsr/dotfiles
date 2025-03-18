-- add `:ZkOrphans` command
require("zk.commands").add("ZkOrphans", function(options)
    options = vim.tbl_extend("force", { orphan = true }, options or {})
    require("zk").edit(options, { title = "Zk Orphans" })
end)

-- improved `:ZkBacklinks`:
-- * jump to usage
-- * auto select if there is only one
require("zk.commands").add("ZkMyBacklinks", function(options)
    options = vim.tbl_extend(
        "force",
        { linkTo = { vim.api.nvim_buf_get_name(0) } },
        options or {}
    )
    local picker_options = {
        title = "Zk Backlinks",
        fzf_options = { "--select-1" },
    }

    local parent_filename = vim.api.nvim_buf_get_name(0):match(".*/(.*).md$")

    require("zk").pick_notes(options, picker_options, function(notes)
        for _, note in ipairs(notes) do
            vim.cmd("e " .. note.absPath)
            vim.cmd("/(" .. parent_filename .. ")")
        end
    end)
end)

local function map_keys(bufnr)
    local function keymap(mode, key, cmd)
        local opts = { noremap = true, silent = false }
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
    end

    -- stylua: ignore start
    -- create note from selection
    keymap("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>")

    -- search notes
    keymap("n", "<leader>zs", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
    keymap("v", "<leader>zs", ":'<,'>ZkMatch<CR>")

    -- backlinks
    keymap("n", "<leader>zb", "<Cmd>ZkMyBacklinks<CR>")
    keymap("n", "_", "<Cmd>ZkMyBacklinks<CR>")

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
