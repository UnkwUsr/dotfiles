vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit" },
    callback = function()
        if
            string.match(vim.fn.expand("%:p:h"), ".dotfiles/.git")
            and vim.fn.getline(1) == ""
            and vim.fn.search("^# Changes to be committed:")
            and vim.fn.search("^#\tmodified:")
        then
            local current_line = vim.fn.getline(".")
            local mtch = string.match(current_line, "^#\tmodified:   (.*)")

            mtch = mtch:gsub("^config/", "")

            mtch = mtch:gsub("^qutebrowser/", "quteb/")
            mtch = mtch:gsub("^quteb/pyconfig/", "quteb/")

            mtch = mtch:gsub("^nvim/lua/user/", "nvim/")
            mtch = mtch:gsub("^nvim/init.lua", "nvim")

            -- remove extensions
            mtch = mtch:gsub("%..+$", "")

            -- remove trailing in like "i3/config"
            mtch = mtch:gsub("/config$", "")
            -- remove trailing in like "tmux/tmux"
            mtch = mtch:gsub("([^/]+)/%1$", "%1")
            -- remove trailing in like "vifm/vifmrc"
            mtch = mtch:gsub("([^/]+)/%1rc$", "%1")

            local final = "WIP [" .. mtch .. "] "
            final = vim.fn.setline(1, final)
            vim.fn.cursor({ 1, 99 })
        end
    end,
})
