local servers = {
    rust_analyzer = {
        autostart = false,
    },
    pylsp = {
        settings = {
            pylsp = {
                configurationSources = { "flake8" },
                plugins = {
                    flake8 = { enabled = true },
                    pyflakes = { enabled = false },
                },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                format = {
                    enable = false,
                },
                diagnostics = {
                    globals = { "vim", "mp" },
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
