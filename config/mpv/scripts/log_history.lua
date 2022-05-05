local HISTFILE = mp.command_native({ "expand-path", "~~home/" }) .. "/history"

function on_fileloaded()
    local path = mp.get_property("path")
    local title = mp.get_property("media-title")

    local logfile = io.open(HISTFILE, "a")
    logfile:write(("%s %s\n"):format(path, title))
    logfile:close()
end

mp.register_event("file-loaded", on_fileloaded)
