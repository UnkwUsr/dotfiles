vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit" },
    callback = function()
        if
            string.match(vim.fn.expand("%:p:h"), ".dotfiles/.git")
            and vim.fn.getline(1) == ""
            and vim.fn.search("^# Changes to be committed:", "n")
            and vim.fn.search(
                "^#\tmodified:",
                "",
                -- searching will be stopped after this line
                vim.fn.search("^# Changes not staged for commit:", "n")
            )
        then
            local current_line = vim.fn.getline(".")
            local mtch = string.match(current_line, "^#\tmodified:   (.*)")
            if not mtch then
                return
            end

            -- stylua: ignore start
            local replaced = mtch
                :gsub("^config/", "")

                :gsub("^qutebrowser/", "quteb/")
                :gsub("^quteb/pyconfig/", "quteb/")

                :gsub("^nvim/lua/user/", "nvim/")
                :gsub("^nvim/init.lua", "nvim")

                -- remove extensions
                :gsub("%..+$", "")

                -- remove trailing in like "i3/config"
                :gsub("/config$", "")
                -- remove trailing in like "tmux/tmux"
                :gsub("([^/]+)/%1$", "%1")
                -- remove trailing in like "vifm/vifmrc"
                :gsub("([^/]+)/%1rc$", "%1")
            -- stylua: ignore end

            local final = "WIP [" .. replaced .. "] "
            final = vim.fn.setline(1, final)
            vim.fn.cursor({ 1, 99 })
        end
    end,
})
