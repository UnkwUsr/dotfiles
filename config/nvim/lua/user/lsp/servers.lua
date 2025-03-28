local servers = {
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                check = {
                    ignore = { "dead_code", "unreachable_code" },
                },
            },
        },
        autostart = false,
    },
    -- haskell
    hls = {
        autostart = false,
        settings = {
            haskell = {
                checkProject = false,
            },
        },
    },
    -- python
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
    -- javascript/typescript
    -- ts_ls = {
    --     single_file_support = false,
    --     root_dir = require("lspconfig").util.root_pattern("package.json"),
    -- },
    -- javascript/typescript, and formatting json
    denols = {
        filetypes = {
            "json",
            unpack(
                require("lspconfig.configs.denols").default_config.filetypes
            ),
        },
    },
    html = {},
    cssls = {},
    bashls = {},
    -- also:
    -- for zk see ../plugins/zk.lua
    -- for null-ls see ../plugins/null_ls.lua
}

return servers
