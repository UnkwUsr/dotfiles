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
    sumneko_lua = {
        settings = {
            Lua = {
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
}

return servers
