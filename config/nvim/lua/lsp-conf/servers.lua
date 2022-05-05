local servers = {
    rust_analyzer = {
        autostart = false,
    pylsp = {
        autostart = false,
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
