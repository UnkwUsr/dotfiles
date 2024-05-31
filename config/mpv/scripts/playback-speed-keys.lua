-- utils

-- speed api

local speed_levels = { 0.5, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 16 }
local default_level = 2
local cur_level = default_level

local function speed_apply_new_level()
    mp.msg.info("cur_level is " .. tostring(cur_level))

    local new_speed = speed_levels[cur_level]
    mp.set_property("speed", new_speed)
end

local function speed_cycle(step)
    cur_level = cur_level + step
    if cur_level < 1 then
        cur_level = 1
    elseif cur_level > #speed_levels then
        cur_level = #speed_levels
    end
    speed_apply_new_level()
end

local function speed_reset()
    cur_level = default_level
    speed_apply_new_level()
end

--

local function show_cur_speed()
    local speed = tonumber(mp.get_property("speed"))
    mp.osd_message(string.format("Speed: %.2f", speed))
end

------

local function speed_prev_safe_handler()
    local speed = tonumber(mp.get_property("speed"))
    if speed <= 1 then
        speed_reset()
    else
        speed_cycle(-1)
    end

    show_cur_speed()
end

local function speed_prev_handler()
    speed_cycle(-1)
    show_cur_speed()
end

local function speed_next_handler()
    speed_cycle(1)
    show_cur_speed()
end

local function speed_reset_handler()
    speed_reset()
    show_cur_speed()
    -- also reset volume level
    mp.set_property("volume", 100)
end

---- finally bind

local should_disable = mp.get_opt("myspeedcontrol-disable")
if should_disable then
    return
end

local function bind(key, name, func)
    mp.add_forced_key_binding(key, name, func, { repeatable = true })
end
bind("[", "speed-prev-safe", speed_prev_safe_handler)
bind("{", "speed-prev", speed_prev_handler)
bind("]", "speed-next", speed_next_handler)
bind("}", "speed-next2", speed_next_handler)
bind("BS", "speed-reset", speed_reset_handler)
