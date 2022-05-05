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
                    globals = {"vim", "mp"}
                },
            }
        },
    },
    ccls = {
        autostart = false,
    },
    bashls = {},
    tsserver = {},
    html = {},
    cssls = {},
}

return servers
