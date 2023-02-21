-- adds sticky floating windows for some txts related buffers (dtm main entry
-- point and remind's filetypes) with special info:
-- * dtm - list of reminds for today
-- * remind filetype - calendar with (with 3 months around today)

local win = -1

local close_window = function(_)
    if win ~= -1 then
        vim.api.nvim_win_close(win, false)
        win = -1
    end
end

local make_window = function(constructor_function, _)
    if win ~= -1 then
        close_window({})
    end

    local buf = vim.api.nvim_create_buf(false, true)
    win = constructor_function(buf)
    vim.api.nvim_win_set_option(win, "winhighlight", "Normal:Normal")
end

--- constructor functions:
-- TODO: constructor functions api can refactor a little bit

local function construct_remind_calendar_window(buf)
    -- vertical calendar with current and +-1 months
    local cmd = "cal -m3 -c1 --color=always"
    local output_lines = vim.fn["systemlist"](cmd)

    -- P.S. I use term here to support `cal`'s current day colorizing
    local term = vim.api.nvim_open_term(buf, {})
    vim.api.nvim_chan_send(term, table.concat(output_lines, "\r\n"))

    local cur_win_w = vim.fn["winwidth"](vim.api.nvim_get_current_win())
    local my_win_w = #output_lines[1] + 5

    return vim.api.nvim_open_win(buf, false, {
        relative = "editor",
        style = "minimal",
        border = "none",
        focusable = false,
        row = 0,
        col = cur_win_w - my_win_w,
        width = my_win_w,
        height = #output_lines,
    })
end

local construct_dtm_remind_window = function(buf)
    local output_lines = vim.fn["systemlist"]("rem")
    vim.api.nvim_buf_set_lines(buf, 0, -1, true, output_lines)

    local cur_win_w = vim.fn["winwidth"](vim.api.nvim_get_current_win())
    local my_win_w = 55

    return vim.api.nvim_open_win(buf, false, {
        relative = "editor",
        style = "minimal",
        border = "none",
        focusable = false,
        row = 0,
        col = cur_win_w - my_win_w,
        width = my_win_w,
        height = #output_lines,
    })
end

---

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { vim.env.HOME .. "/.reminders/*.rem" },
    callback = function(ev)
        make_window(construct_remind_calendar_window, ev)
    end,
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { vim.env.HOME .. "/txts/dtm/plans.md" },
    callback = function(ev)
        make_window(construct_dtm_remind_window, ev)
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
    pattern = {
        vim.env.HOME .. "/.reminders/*.rem",
        vim.env.HOME .. "/txts/dtm/plans.md",
    },
    callback = close_window,
})
