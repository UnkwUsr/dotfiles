local function map_keys(client, bufnr)
    local function keymap(mode, key, cmd)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
    end

    -- stylua: ignore start
    keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
    keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
    keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    keymap("n", "<space>c", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    keymap("v", "<space>c", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
    -- stylua: ignore end

    if client.server_capabilities.documentFormattingProvider then
        -- stylua: ignore
        keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
    elseif client.server_capabilities.documentRangeFormattingProvider then
        -- stylua: ignore
        keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
    end
end

local on_attach = function(client, bufnr)
    -- disable formatting for tsserver. I use deno_fmt from null-ls
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    map_keys(client, bufnr)
end

return on_attach
