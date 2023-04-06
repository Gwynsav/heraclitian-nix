--------------------------------
-- notification configuration --
--------------------------------

-- Imports
----------
local awful     = require('awful')
local gears     = require('gears')
local wibox     = require('wibox')
local ruled     = require('ruled')
local naughty   = require('naughty')
local beautiful = require('beautiful')
local dpi       = beautiful.xresources.apply_dpi
local gfs       = gears.filesystem
local gc        = gears.color

local def_icon  = gc.recolor_image(
                    gfs.get_configuration_dir() .. "themes/assets/notification/def_notif.svg",
                    beautiful.notification_accent)

local helpers   = require('helpers')
local rubato    = require('modules.rubato')

-- Notifications
----------------
naughty.config.defaults.timeout = 5
ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            ontop            = true,
            implicit_timeout = 6,
            border_width     = 0,
            position         = beautiful.notification_position
        }
    }
end)

naughty.connect_signal("request::icon", function(n, context, hints)
    if context ~= "app_icon" then
        return
    end
    local path = require('menubar').utils.lookup_icon(hints.app_icon) or
                 require('menubar').utils.lookup_icon(hints.app_icon:lower())
    if path then
        n.icon = path
    end
end)
naughty.connect_signal("request::action_icon", function(a, context, hints)
    a.icon = menubar.utils.lookup_icon(hints.id)
end)

naughty.connect_signal("request::display", function(n)
    
    local timeout = n.timeout
    n.timeout = 999999

    -- Basics
    local title = wibox.widget {
        widget        = wibox.container.scroll.horizontal,
        step_function = wibox.container.scroll.step_functions.
                        waiting_nonlinear_back_and_forth,
        speed         = 100,
        rate          = 144,
        {
            markup = n.title:match('.') and "<b>" .. n.title .. "</b>"
                                         or "<b>Notification</b>",
            font   = beautiful.ui_font .. dpi(beautiful.notif_size / 8),
            halign = "center",
            widget = wibox.widget.textbox
        }
    }
    local summary = wibox.widget {
        widget        = wibox.container.scroll.horizontal,
        step_function = wibox.container.scroll.step_functions.
                        waiting_nonlinear_back_and_forth,
        speed         = 100,
        rate          = 144,
        {
            widget = wibox.widget.textbox,
            halign = "center",
            font   = beautiful.ui_font .. dpi(beautiful.notif_size / 9),
            text   = gears.string.xml_unescape(n.message)
        }
    }

    -- Fancy timeout image frame animation
    local image = wibox.widget {
        widget = wibox.widget.imagebox,
        image  = n.icon and helpers.crop_surface(1, gears.surface.load_uncached(n.icon))
                 or helpers.crop_surface(1, gears.surface.load_uncached(def_icon)),
        resize = true,
        align  = "center",
        horizontal_fit_policy = "fit",
        vertical_fit_policy   = "fit",
        clip_shape    = helpers.mkroundedrect(),
        buttons = {
            awful.button({}, 1, function() n:destroy() end)
        }
	  }
    -- Animation stolen right off the certified animation lady.
    local timeout_graph = wibox.widget {
        widget    = wibox.container.arcchart,
        min_value = 0,
        max_value = 100,
        value     = 0,
        thickness = dpi(beautiful.notif_size / 24),
        paddings  = dpi(beautiful.notif_size / 24),
        rounded_edge = true,
        colors       = { beautiful.notification_accent },
        bg           = beautiful.lbg,
        forced_height = dpi(beautiful.notif_size * 3/4),
        forced_width  = dpi(beautiful.notif_size * 3/4),
        image
    }

    -- Action buttons
    local actions = wibox.widget {
        notification = n,
        base_layout  = wibox.widget {
            spacing  = dpi(beautiful.notif_size / 24),
            layout   = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id       = "text_role",
                        font     = beautiful.ui_font .. dpi(beautiful.notif_size / 11),
                        widget   = wibox.widget.textbox
                    },
                    align  = "center",
                    widget = wibox.container.place
                },
                bottom = dpi(beautiful.notif_size / 18),
                top    = dpi(beautiful.notif_size / 18),
                left   = dpi(beautiful.notif_size / 12),
                right  = dpi(beautiful.notif_size / 12),
                widget = wibox.container.margin
            },
            bg            = beautiful.blk,
            widget        = wibox.container.background
        },
        style  = {
            underline_normal    = false,
            underline_selected  = false,
            bg_normal           = beautiful.blk,
            bg_normal           = beautiful.gry
        },
        widget = naughty.list.actions
    }

    -- The actual notification
    local widget = naughty.layout.box { 
        notification = n, 
        cursor       = "hand2",
        shape        = helpers.mkroundedrect(),
        widget_template = {
            {
                {
                    {
                        {
                            timeout_graph,
                            margins = dpi(beautiful.notif_size / 10),
                            widget  = wibox.container.margin
                        },
                        strategy = "min",
                        width    = dpi(beautiful.notif_size / 3),
                        widget   = wibox.container.constraint
                    },
                    strategy = "max",
                    width    = dpi(beautiful.notif_size * 1.5),
                    widget   = wibox.container.constraint
                },
                {
                    {
                        {
                            {
                                {
                                    {
                                        {
                                            title,
                                            halign = "center",
                                            widget = wibox.container.place
                                        },
                                        {
                                            summary,
                                            halign = "center",
                                            widget = wibox.container.place
                                        },
                                        {
                                            {
                                                actions,
                                                shape  = helpers.mkroundedrect(),
                                                widget = wibox.container.background
                                            },
                                            left    = dpi(beautiful.notif_size / 18),
                                            right   = dpi(beautiful.notif_size / 18),
                                            top     = dpi(beautiful.notif_size / 24),
                                            widget  = wibox.container.margin,
                                            visible = n.actions and #n.actions > 0
                                        },
                                        spacing = dpi(beautiful.notif_size / 24),
                                        layout  = wibox.layout.fixed.vertical
                                    },
                                    align  = "center",
                                    widget = wibox.container.place
                                },
                                margins = {
                                    left   = dpi(beautiful.notif_size / 4),
                                    right  = dpi(beautiful.notif_size / 4),
                                    bottom = dpi(beautiful.notif_size / 8),
                                    top    = dpi(beautiful.notif_size / 8)
                                },
                                widget  = wibox.container.margin
                            },
                            bg     = beautiful.lbg,
                            shape  = helpers.mkroundedrect(),
                            widget = wibox.container.background
                        },
                        strategy = "min",
                        width    = dpi(beautiful.notif_size * 2),
                        widget   = wibox.container.constraint
                    },
                    strategy = "max",
                    width    = dpi(beautiful.notif_size * 3),
                    height   = dpi(beautiful.notif_size * 1.3),
                    widget   = wibox.container.constraint
                },
                layout = wibox.layout.fixed.horizontal
            },
            id     = "background_role",
            bg     = beautiful.nbg,
            widget = naughty.container.background
        }
    }
    widget.buttons = {}
    local anim = rubato.timed {
        intro      = 0,
        duration   = timeout,
        subscribed = function(pos, time)
            timeout_graph.value = pos
            if time == timeout then
                n:destroy()
            end
        end
    }
    widget:connect_signal("mouse::enter", function()
        anim.pause = true
    end)

    widget:connect_signal("mouse::leave", function()
        anim.pause = false
    end)
    anim.target     = 100
end)
