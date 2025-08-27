local LOOP_DUR_RANGE = { 0.1, 2 }
local SESSION_LOOPS_COOUNT_RANGE = { 2, 4 }

local function random_float(lower, greater)
    return lower + math.random() * (greater - lower)
end

local function clear_terminal_output()
    io.write("\027[H\027[2J")
end
local function on_file_loaded()
    clear_terminal_output()

    local loop_dur = random_float(unpack(LOOP_DUR_RANGE))
    local session_loops_count = math.random(unpack(SESSION_LOOPS_COOUNT_RANGE))
    print("session_dur:", session_loops_count)
    local this_session_dur = loop_dur * session_loops_count

    local full_time = mp.get_property("time-remaining/full")
    if not full_time then
        mp.command("playlist-next")
        return
    end

    local seek_point = random_float(0, full_time)
    mp.command("seek " .. seek_point)
    print("loop_dur:", loop_dur)
    mp.set_property("ab-loop-a", seek_point)
    mp.set_property("ab-loop-b", seek_point + loop_dur)
    -- in case file duration is less than selected session duration
    mp.set_property("loop-file", "inf")

    mp.add_timeout(this_session_dur, function()
        -- TODO: if we have plaliyst with one entry, then do this:
        -- on_file_loaded()
        -- otherwise do this:
        mp.command("playlist-next")

        -- clear loop-ab
        -- mp.set_property("ab-loop-a", "no")
        -- mp.set_property("ab-loop-b", "no")
    end)
end

local function start()
    mp.register_event("file-loaded", on_file_loaded)

    -- fix for having different random seed for processes when started multiple at
    -- once. Weird that this even happens
    math.randomseed(io.popen("readlink /proc/self"):read())
end

if mp.get_opt("noise-repeatedly-enable") then
    start()
end
