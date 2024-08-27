-- this plugin allows making closely measured loops with mouse wheel, switching
-- between start/end of loop and adjusting step size

local utils = require("mp.utils")

local STEP = 0.01

local function bind(key, name, func)
    mp.add_forced_key_binding(key, name, func, { repeatable = true })
end

local function handle_overflow()
    local a = tonumber(mp.get_property("ab-loop-a"))
    local b = tonumber(mp.get_property("ab-loop-b"))
    if a == nil or b == nil then
        return
    end
    if a >= b then
        mp.set_property("ab-loop-b", a)
        mp.set_property("ab-loop-a", b)
    end

    local time = tonumber(mp.get_property("time-pos"))
    if time >= b then
        mp.set_property("time-pos", a)
        mp.msg.info("time overflow, seek to a")
    end
    if time < a then
        mp.set_property("time-pos", a)
        mp.msg.info("time overflow, seek to a")
    end
end

local function show_status()
    local function g(key)
        local prop_val = tonumber(mp.get_property("ab-loop-" .. key)) or -1
        return string.format("%s = %.2f", key, prop_val)
    end
    mp.osd_message(g("a") .. "\n" .. g("b"), 3)
end

local function adjust_ab_loop(key, adj_func)
    local prop_name = "ab-loop-" .. key
    local prop_val = tonumber(mp.get_property(prop_name))
    if prop_val == nil then
        -- if not set yet, then set to current playback position
        prop_val = mp.get_property("time-pos")
    end
    prop_val = adj_func(prop_val)
    mp.set_property(prop_name, prop_val)
    handle_overflow()

    show_status()
end

local function switch_to_ab_loops(key)
    -- WHEEL_UP, WHEEL_DOWN
    -- WHEEL_LEFT, WHEEL_RIGHT

    return function()
        bind("WHEEL_DOWN", "loop_wheel_down", function()
            adjust_ab_loop(key, function(x)
                return x - STEP
            end)
        end)
        bind("WHEEL_UP", "loop_wheel_up", function()
            adjust_ab_loop(key, function(x)
                return x + STEP
            end)
        end)
    end
end

local function cut_current_loop()
    local path = mp.get_property("path")
    local a = mp.get_property("ab-loop-a")
    local b = mp.get_property("ab-loop-b")
    -- stylua: ignore
    local args = {
        "ffmpeg", "-loglevel", "panic", "-hide_banner",
        "-i", path,
        "-ss", a,
        "-to", b,
        os.getenv("HOME") .. "/loop_cut_" .. path .. "_" .. a .. "_to_" .. b .. ".flac",
    }

    utils.subprocess_detached({ args = args })
    mp.osd_message("saved current cut loop", 3)
end

local function switch_to_step()
    bind("WHEEL_DOWN", "step_wheel_down", function()
        STEP = STEP / 2
        mp.osd_message("step = " .. STEP, 3)
    end)
    bind("WHEEL_UP", "step_wheel_up", function()
        STEP = STEP * 2
        mp.osd_message("step = " .. STEP, 3)
    end)
end

bind("z", "switch-to-a-loops", switch_to_ab_loops("a"))
bind("x", "switch-to-b-loops", switch_to_ab_loops("b"))
bind("c", "switch-to-step", switch_to_step)
bind("alt+z", "cut-current-loop", cut_current_loop)
