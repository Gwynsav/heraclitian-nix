-----------------------
-- scratchpad config --
-----------------------

-- Imports
----------
local beautiful = require('beautiful')
local dpi       = beautiful.xresources.apply_dpi

local bling     = require('modules.bling')
local rubato    = require('modules.rubato')

-- Animation
------------
local anim_y = rubato.timed {
    pos             = dpi(beautiful.resolution * 101),
    rate            = 60,
    easing          = rubato.quadratic,
    intro           = 0.1,
    duration        = 0.3,
    awestore_compat = true -- This option must be set to true.
}
local anim_x = rubato.timed {
    pos             = dpi(beautiful.resolution * 40),
    rate            = 60,
    easing          = rubato.quadratic,
    intro           = 0.1,
    duration        = 0.3,
    awestore_compat = true -- This option must be set to true.
}

-- Setup
--------
-- Positioning spaguetti. Essentially, this block ensures the scratchpad is always at the center of
-- the work area by taking the dimensions of the wibar and its gaps into account.
local bar_dimensions = beautiful.bar_gap and beautiful.bar_size + beautiful.outer_gaps or beautiful.bar_size
local x_position     = 
    not beautiful.bar_enabled or beautiful.bar_type == "horizontal" and
        (beautiful.resolution * beautiful.aspect_ratio * 100 - beautiful.scratchpad_width) / 2 
    or beautiful.bar_position == "left" and 
        (beautiful.resolution * beautiful.aspect_ratio * 100 - beautiful.scratchpad_width + bar_dimensions) / 2
    or beautiful.bar_position == "right" and 
        (beautiful.resolution * beautiful.aspect_ratio * 100 - beautiful.scratchpad_width - bar_dimensions) / 2
local y_position     = 
    not beautiful.bar_enabled or beautiful.bar_type == "vertical" and
        (beautiful.resolution * 100 - beautiful.scratchpad_height) / 2
    or beautiful.bar_position == "top" and 
        (beautiful.resolution * 100 - beautiful.scratchpad_height + bar_dimensions) / 2
    or beautiful.bar_position == "bottom" and 
        (beautiful.resolution * 100 - beautiful.scratchpad_height - bar_dimensions) / 2

-- Determine terminal runtime command and rule matching title/class.
-- Works for a few terminals, may need manual tuning for some others.
-- Left it as an if statement for easier future expansion.
local term_name = terminal
if terminal == "wezterm" then
    term_name = terminal .. term_cmd
end
local rule_name = " --class "
if terminal == "tym" then
    rule_name = " --role "
elseif terminal:match("xterm") then
    rule_name = " -class "
end

local scratch = {}

-- Terminal scratchpad
scratch.terminal = bling.module.scratchpad {
    command     = term_name .. rule_name .. "spad",
    -- The rule that the scratchpad will be searched by
    rule        = terminal == "tym" and { role  = "spad" } 
                  or { class = "spad" },
    autoclose   = true, -- Whether it should hide itself when losing focus
    floating    = true,
    sticky      = true,
    geometry    = { 
        x      = dpi(x_position), 
        y      = dpi(y_position), 
        height = dpi(beautiful.scratchpad_height), 
        width  = dpi(beautiful.scratchpad_width) 
    }, 
    -- Reopening the scratchpad resets geometry properties.
    reapply     = true,
    rubato      = { x = anim_x, y = anim_y },
    dont_focus_before_close  = false                      
}

-- Music player scratchpad
local music_height = dpi(beautiful.resolution * 45)
local music_width  = dpi(beautiful.resolution * beautiful.aspect_ratio * 33)
local x_music     = 
    not beautiful.bar_enabled or beautiful.bar_type == "horizontal" and
        (beautiful.resolution * beautiful.aspect_ratio * 100 - music_width) / 2 
    or beautiful.bar_position == "left" and 
        (beautiful.resolution * beautiful.aspect_ratio * 100 - music_width + bar_dimensions) / 2
    or beautiful.bar_position == "right" and 
        (beautiful.resolution * beautiful.aspect_ratio * 100 - music_width - bar_dimensions) / 2
local y_music     = 
    not beautiful.bar_enabled or beautiful.bar_type == "vertical" and
        (beautiful.resolution * 100 - music_height) / 2
    or beautiful.bar_position == "top" and 
        (beautiful.resolution * 100 - music_height + bar_dimensions) / 2
    or beautiful.bar_position == "bottom" and 
        (beautiful.resolution * 100 - music_height - bar_dimensions) / 2

scratch.music = bling.module.scratchpad {
    command     = terminal .. term_cmd .. "ncmpcpp" .. rule_name .. "ncmpcpp",
    -- The rule that the scratchpad will be searched by
    rule        = terminal == "tym" and { role  = "ncmpcpp" } 
                  or { class = "ncmpcpp" },
    autoclose   = true, -- Whether it should hide itself when losing focus
    floating    = true,
    sticky      = true,
    geometry    = { 
        x      = dpi(x_music), 
        y      = dpi(y_music), 
        height = dpi(music_height), 
        width  = dpi(music_width) 
    }, 
    -- Reopening the scratchpad resets geometry properties.
    reapply     = true,
    rubato      = { x = anim_x, y = anim_y },
    dont_focus_before_close  = false                      
}

return scratch
