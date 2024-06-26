-- "~/.config/mpv/history" by default
-- P.S. sometimes this file may be messed with encodings and vim will fail to
-- determine it correct. It this case do `:set fileencoding=utf-8` and write
-- file

local custom_file = mp.get_opt("log-history-custom-file")
local filename = "history"
if custom_file then
    filename = custom_file
end

local HISTFILE = mp.command_native({ "expand-path", "~~home/" })
    .. "/"
    .. filename

-- log format:
-- <date> <time> <url> <artist_name_if_exist> - <track_title>
-- example:
-- 2022-07-17 17:32 https://someurl.fm/stream artist name - track title

local function logline(path, title)
    local artist = mp.get_property("metadata/by-key/artist")
    if artist ~= nil then
        title = artist .. " - " .. title
    else
        local uploader = mp.get_property("metadata/by-key/uploader")
        if uploader ~= nil then
            title = uploader .. " - " .. title
        end
    end

    local logfile = io.open(HISTFILE, "a")
    if logfile ~= nil then
        local date = os.date("%Y-%m-%d %H:%M")
        logfile:write(("%s %s %s\n"):format(date, path, title))
        logfile:close()
    else
        mp.osd_message("[log_history] Can't open file " .. HISTFILE)
    end
end

local function on_title_change(_, new_title)
    -- this is the first empty init event, ignore it
    if new_title == nil then
        return
    end

    local cur_filename = mp.get_property("filename")
    if new_title == cur_filename then
        -- there is a problem in that on opening file this event sends title
        -- equals to filename. And then a bit later mpv parses title from file
        -- and sends this event again already with right title. And real
        -- problem in that not every file have right title, so, for some files
        -- this event fires only once, with title equals to filename.
        --
        -- I decided to log the case when title equas to filename, so we not
        -- lose valuable entries of any files
        --
        -- and yes, we taking that if file have right title, then in log file
        -- there will be 2 entries: first fired on file opening, and second
        -- with right title
        logline("", new_title)
        return
    end

    local path = mp.get_property("path")
    logline(path, new_title)
end

mp.observe_property("media-title", "string", on_title_change)
