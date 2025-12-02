local function reload_handler()
    local path = mp.get_property("path")
    local duration = mp.get_property_native("duration")

    if duration and duration >= 0 then
        local time_pos = mp.get_property("time-pos")
        mp.commandv("loadfile", path, "replace", -1, "start=+" .. time_pos)
    else
        -- stream
        mp.commandv("loadfile", path, "replace")
    end
    -- mp.osd_message("Reloaded")
end

local function reload_handler_yt_high()
    -- leaving empty makes use of yt-dlp own config file
    mp.set_property("ytdl-format", "")
    mp.osd_message("Reloading to yt high quality")
    reload_handler()
end

local function reload_handler_yt_low()
    -- setting "best" will select stream that have both video and audio in one
    -- file
    mp.set_property("ytdl-format", "best")
    mp.osd_message("Reloading to yt low quality")
    reload_handler()
end

mp.add_key_binding(nil, "reload", reload_handler)
mp.add_key_binding(nil, "reload-to-yt-high", reload_handler_yt_high)
mp.add_key_binding(nil, "reload-to-yt-low", reload_handler_yt_low)
