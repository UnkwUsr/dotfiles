local servers = require("lsp-conf.servers")

for server_name, settings in pairs(servers) do
    local opts = {
        on_attach = require("lsp-conf.on_attach"),
    }
    opts = vim.tbl_extend("keep", opts, settings)

    require('lspconfig')[server_name].setup(opts)
end
