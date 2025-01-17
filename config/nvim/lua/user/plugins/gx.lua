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


vim.keymap.set({ "n", "x" }, "gx", "<cmd>Browse<cr>")
