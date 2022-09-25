-- "~/.config/mpv/history" by default
local HISTFILE = mp.command_native({ "expand-path", "~~home/" }) .. "/history"

-- log format:
-- <url> <artist_name_if_exist> - <track_title>
-- example:
-- https://someurl.fm/stream artist name - track title

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
        logfile:write(("%s %s\n"):format(path, title))
        logfile:close()
    else
        mp.osd_message("[log_history] Can't open file " .. HISTFILE)
    end
end

local function on_title_change(_, new_title)
    local filename = mp.get_property("filename")
    if new_title == filename then
        return
    end

    local path = mp.get_property("path")
    logline(path, new_title)
end

mp.observe_property("media-title", "string", on_title_change)
