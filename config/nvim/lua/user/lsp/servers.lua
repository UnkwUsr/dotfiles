local servers = {
    rust_analyzer = {
        autostart = false,
    },
    hls = {
        autostart = false,
        settings = {
            haskell = {
                checkProject = false,
            },
        },
    },
    pylsp = {
        settings = {
            pylsp = {
                configurationSources = { "flake8" },
                plugins = {
                    flake8 = {
                        enabled = true,
                        maxLineLength = 88,
                        extendIgnore = { "E203" },
                    },
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
    ts_ls = {},
    html = {},
    cssls = {},
    bashls = {},
    -- also:
    -- for zk see ../plugins/zk.lua
    -- for null-ls see ../plugins/null_ls.lua
}

return servers
