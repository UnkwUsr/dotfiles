local servers = {
    rust_analyzer = {
        autostart = false,
    },
    hls = {
        settings = {
            haskell = {
                checkProject = false,
                formattingProvider = "floskell",
            },
        },
    },
    pylsp = {
        settings = {
            pylsp = {
                configurationSources = { "flake8" },
                plugins = {
                    flake8 = { enabled = true },
                    pyflakes = { enabled = false },
                    pycodestyle = { enabled = false },
                },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                format = {
                    -- I use stylua for format
                    enable = false,
                },
                workspace = {
                    -- suppress annoying prompt on each start
                    checkThirdParty = false,
                },
            },
        },
    },
    -- c/c++
    ccls = {
        autostart = false,
    },
    -- php
    intelephense = {},
    tsserver = {},
    html = {},
    cssls = {},
    -- also:
    -- for zk see lua/user/plugins/zk.lua
    -- for null-ls see lua/user/plugins/null-ls.lua
}

return servers
