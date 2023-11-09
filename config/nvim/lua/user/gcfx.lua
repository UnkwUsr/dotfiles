-- create fixup commit on commit under cursor

local util = require("gitsigns.util")
local gs_cache = require("gitsigns.cache")
local cache = gs_cache.cache
local void = require("gitsigns.async").void

-- git-blame line under cursor and extract commit hash, then pass it to
-- callback
local bm_api = void(function(callback)
    local bufnr = vim.api.nvim_get_current_buf()
    local bcache = cache[bufnr]
    if not bcache then
        return
    end

    local buftext = util.buf_lines(bufnr)
    local lnum = vim.api.nvim_win_get_cursor(0)[1]
    local result = bcache.git_obj:run_blame(buftext, lnum, nil)
    assert(result)

    local sha = result[lnum].commit.abbrev_sha
    local is_committed = sha and tonumber("0x" .. sha) ~= 0
    if not is_committed then
        sha = ""
    end

    callback(sha)
end)

local function gcfx()
    bm_api(function(sha)
        vim.schedule(function()
            -- I use there my other script git-fxa because it's handy to
            -- confirm selectopn and see preview of the commit
            vim.cmd("term git fxa --query=" .. sha)
        end)
    end)
end

vim.api.nvim_create_user_command("Gcfx", gcfx, {})
