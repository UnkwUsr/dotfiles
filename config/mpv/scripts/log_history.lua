local HISTFILE = mp.command_native({"expand-path", "~~home/"}) .. "/history";
local logfile = io.open(HISTFILE, "a");

mp.register_event('file-loaded', function ()
    logfile:write(("%s\n"):format(mp.get_property("path")));
end)
