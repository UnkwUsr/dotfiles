local function reload_handler()
    local path = mp.get_property("path")
    local duration = mp.get_property_native("duration")

    if duration and duration >= 0 then
        local time_pos = mp.get_property("time-pos")
        mp.commandv("loadfile", path, "replace", "start=+" .. time_pos)
    else
        -- stream
        mp.commandv("loadfile", path, "replace")
    end
end

mp.add_key_binding(nil, "reload", reload_handler)
