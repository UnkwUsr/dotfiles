-- disable built-in netrw gx
vim.g.netrw_nogx = 1

require("gx").setup({
    -- hack to spawn in background
    open_browser_app = "/bin/sh",
    open_browser_args = { "-c", '"$BROWSER" "$1" & disown', "sh" },

    handlers = {
        plugin = true, -- open plugin links in lua/vim (e.g. plug, packer, lazy, ..)
        github = true, -- open github issues
        brewfile = false, -- open Homebrew formulaes and casks
        package_json = false, -- open dependencies from package.json
        search = false, -- search the web/selection on the web if nothing else is found
        go = false, -- open pkg.go.dev from an import statement (uses treesitter)
        rust = { -- custom handler to open rust's cargo packages
            name = "rust", -- set name of handler
            filetype = { "toml" }, -- you can also set the required filetype for this handler
            filename = "Cargo.toml", -- or the necessary filename
            handle = function(mode, line, _)
                local crate =
                    require("gx.helper").find(line, mode, "(%w+)%s-=%s")

                if crate then
                    return "https://crates.io/crates/" .. crate
                end
            end,
        },
    },
    handler_options = {
        search_engine = "duckduckgo",
        select_for_search = true, -- if your cursor is e.g. on a link, the pattern for the link AND for the word will always match. This disables this behaviour for default so that the link is opened without the select option for the word AND link

        git_remotes = { "upstream", "origin" }, -- list of git remotes to search for git issue linking, in priority
        -- git_remotes = function(fname) -- you can also pass in a function
        --     if fname:match("myproject") then
        --         return { "mygit" }
        --     end
        --     return { "upstream", "origin" }
        -- end,
        git_remote_push = false, -- use the push url for git issue linking,
    },
})

vim.keymap.set({ "n", "x" }, "gx", function()
    -- highlight current line for few milliseconds. This utilizes autocmd
    -- on_yank
    local t = vim.fn.getreg("o")
    vim.cmd.normal('"oyy')
    vim.fn.setreg("o", t)

    vim.cmd("Browse")
end)

-- google line under cursor and delete it
-- (normal mode is actually markdown specific (it takes list item))
vim.keymap.set({ "n", "v" }, "<leader>v", function()
    local mode = vim.api.nvim_get_mode().mode
    local text_to_search
    if mode == "n" then
        -- yank text from second word of the line to the end to "h register
        local reg_h = vim.fn.getreg("h")
        vim.cmd.normal('^w"hy$')
        text_to_search = vim.fn.getreg("h")
        vim.fn.setreg("h", reg_h)
    elseif mode == "v" then
        text_to_search = vim.fn.getregion(
            vim.fn.getpos("v"),
            vim.fn.getpos("."),
            { type = "v" }
        )[1]
    end

    vim.system({ "quteb", text_to_search }, { detach = true })

    if mode == "n" then
        vim.cmd.normal("dd")
    end
    print("quteb:", text_to_search)
end)
