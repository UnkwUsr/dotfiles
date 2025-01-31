local lsp_status = require("lsp-status")
lsp_status.register_progress()
lsp_status.config({
    show_filename = false,

    status_symbol = "",
    indicator_separator = "",
    indicator_errors = "E:",
    indicator_warnings = "W:",
    indicator_info = "I:",
    indicator_hint = "H:",
    indicator_ok = "",
})

function Lua_LspStatus()
    local status = require("lsp-status").status()
    if status == "  " then
        status = " "
    end

    return status
end

function Lua_LspClients()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if not vim.tbl_isempty(clients) then
        clients = vim.tbl_map(function(x)
            return x.name
        end, clients)
        local sclients = table.concat(clients, ", ")

        return sclients
    end
    return ""
end
