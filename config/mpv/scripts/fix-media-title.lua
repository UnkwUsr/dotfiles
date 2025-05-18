-- if artist and title available, use that. Otherwise filename. Difference from
-- default is that it adds artist (default has only title)

local function on_file_loaded()
    local new_title = ""

    local title = mp.get_property("metadata/by-key/title")
    local artist = mp.get_property("metadata/by-key/artist")
    if title ~= nil and artist ~= nil then
        new_title = artist .. " - " .. title
    else
        new_title = mp.get_property("filename")
    end

    mp.set_property("force-media-title", new_title)
end

mp.register_event("file-loaded", on_file_loaded)
