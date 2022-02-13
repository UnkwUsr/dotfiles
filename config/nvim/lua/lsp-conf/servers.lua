local servers = {
    rust_analyzer = {
        autostart = false,
    },
    pyright = {},
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
