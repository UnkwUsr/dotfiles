local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local servers = require("user.lsp.servers")
for server_name, settings in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.on_attach"),
        capabilities = capabilities,
    }
    opts = vim.tbl_extend("keep", opts, settings)

    require("lspconfig")[server_name].setup(opts)
end
