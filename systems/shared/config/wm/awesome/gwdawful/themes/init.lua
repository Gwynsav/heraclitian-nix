----------------------
-- theming settings --
----------------------

-- Imports
----------
local awful     = require('awful')
local gears     = require('gears')
local beautiful = require('beautiful')
local wibox     = require('wibox')
local gc        = gears.color
local gfs       = gears.filesystem
local dpi       = beautiful.xresources.apply_dpi

local user      = require('userconf')

local clrs      = require('themes.palettes.' .. user.clr_palette)
local asst_dir  = gfs.get_configuration_dir() .. "themes/assets/"
local pltt_dir  = gfs.get_configuration_dir() .. "themes/palettes/" .. user.clr_palette .. "/"
local awes_dir  = gfs.get_themes_dir() .. "default/layouts/"

local theme     = {}

------------
-- Colors --
------------
theme.nbg   = clrs.nbg
theme.lbg   = clrs.lbg
theme.blk   = clrs.blk
theme.gry   = clrs.gry
theme.wht   = clrs.wht
theme.dfg   = clrs.dfg
theme.nfg   = clrs.nfg

theme.red   = clrs.red
theme.red_d = clrs.red_d
theme.grn   = clrs.grn
theme.grn_d = clrs.grn_d
theme.ylw   = clrs.ylw
theme.ylw_d = clrs.ylw_d
theme.blu   = clrs.blu
theme.blu_d = clrs.blu_d
theme.mag   = clrs.mag
theme.mag_d = clrs.mag_d
theme.cya   = clrs.cya
theme.cya_d = clrs.cya_d

-- General
theme.bg_normal = theme.nbg
theme.bg_focus  = theme.lbg
theme.bg_urgent = theme.blk
theme.fg_normal = theme.nfg
theme.fg_focus  = theme.nfg
theme.fg_urgent = theme.red

--------------
-- Settings --
--------------
-- General
----------
theme.modkey                  = user.modkey ~= nil and user.modkey or "Mod4"

theme.caps_super              = false
if user.caps_super ~= nil then
   theme.caps_super = user.caps_super
end

theme.kb_layout1              = user.kb_layout1
theme.kb_layout2              = user.kb_layout2
if theme.caps_super and kb_layout1 ~= nil then
    awful.spawn.once('setxkbmap '.. theme.kb_layout1 ..' -option caps:super')
end

theme.hover_focus             = false
if user.hover_focus ~= nil then
   theme.hover_focus = user.hover_focus
end

-- Scaling
----------
theme.resolution              = user.resolution ~= nil   and user.resolution / 100 or 10.8
theme.aspect_ratio            = user.aspect_ratio ~= nil and user.aspect_ratio or 16/9
if user.dpi ~= nil then
    beautiful.xresources.set_dpi(user.dpi)
end

-- Features
-----------
theme.battery_enabled         = false
if user.battery ~= nil then
   theme.battery_enabled = user.battery
end
theme.battery_name            = user.battery_name ~= nil    and user.battery_name    or "battery_BAT0"

theme.brightness_enabled      = false
if user.brightness ~= nil then
   theme.brightness_enabled = user.brightness
end
theme.brightness_name         = user.brightness_name ~= nil and user.brightness_name or "intel_backlight"

theme.bluetooth_enabled       = false
if user.bluetooth ~= nil then
   theme.bluetooth_enabled = user.bluetooth
end

-- Fonts 
--------
-- the space at the end is necessary
theme.ui_font                 = user.ui_font ~= nil and user.ui_font .. " " or "IBM Plex Sans "
theme.ic_font                 = user.ic_font ~= nil and user.ic_font .. " " or "Material Icons "
theme.mn_font                 = user.mn_font ~= nil and user.mn_font .. " " or "IBM Plex Mono "
-- default font
theme.font                    = theme.ui_font .. "Medium " .. dpi(theme.resolution * 0.92)

-- Gaps
-------
theme.useless_gap             = user.inner_gaps ~= nil and dpi(user.inner_gaps * theme.resolution)
                                or dpi(0.4 * theme.resolution)
theme.outer_gaps              = user.outer_gaps ~= nil and user.outer_gaps * theme.resolution
                                or 3 * theme.useless_gap

-- Borders & Corners 
--------------------
theme.border_radius           = user.border_rad ~= nil and user.border_rad * theme.resolution
                                or 0.8 * theme.resolution

theme.rounded_clients         = false
if user.round_client ~= nil then
   theme.rounded_clients = user.round_client
end

theme.border_width            = user.border_size ~= nil and dpi(user.border_size * theme.resolution)
                                or dpi(0)
theme.border_width_maximized  = dpi(theme.border_width)
theme.fullscreen_hide_border  = true
theme.border_color_active     = theme.blk
theme.border_color_normal     = theme.lbg
theme.border_color_urgent     = theme.red

-- Images
---------
-- wallpaper setting
theme.wallpaper               = user.wall ~= nil and user.wall
                                or pltt_dir .. "wall.png"
gears.wallpaper.maximized(theme.wallpaper)
-- others
theme.user_avatar             = user.avatar ~= nil and user.avatar
                                or asst_dir .. "user.png"
theme.player_bg               = user.player_bg ~= nil and user.player_bg
                                or pltt_dir .. "player.png"
theme.icon_theme              = user.icon_pack ~= nil and user.icon_pack or "Papirus"
theme.screenshot_dir          = user.scrnshot_dir == nil and os.getenv("HOME") .. "/Pictures/" or user.scrnshot_dir
-- Awesome icon
if user.awm_icon == nil then
    theme.awesome_icon = require('beautiful.theme_assets').awesome_icon(dpi(theme.resolution * 10), theme.fg_normal, theme.bg_normal)
elseif user.awm_icon == "arch" then
    theme.awesome_icon = gc.recolor_image(asst_dir .. "distro/arch.svg", theme.cya)
elseif user.awm_icon == "debian" then
    theme.awesome_icon = gc.recolor_image(asst_dir .. "distro/debian.svg", theme.red_d)
elseif user.awm_icon == "fedora" then
    theme.awesome_icon = gc.recolor_image(asst_dir .. "distro/fedora.svg", theme.blu)
elseif user.awm_icon == "nix" then
    theme.awesome_icon = gc.recolor_image(asst_dir .. "distro/nix.svg", theme.blu)
elseif user.awm_icon == "ubuntu" then
    theme.awesome_icon = gc.recolor_image(asst_dir .. "distro/ubuntu.svg", theme.red)
elseif user.awm_icon == "void" then
    theme.awesome_icon = gc.recolor_image(asst_dir .. "distro/void.svg", theme.grn)
else
    theme.awesome_icon = user.awm_icon
end

-- Bar
------
theme.bar_enabled             = true
if user.bar_enabled ~= nil then
   theme.bar_enabled = user.bar_enabled
end

theme.bar_gap                 = false
if user.bar_gap ~= nil then
   theme.bar_gap = user.bar_gap
end

theme.bar_position            = user.bar_pos ~= nil     and user.bar_pos     or "left"
theme.bar_type                = (theme.bar_position == "left" or theme.bar_position == "right") and "vertical" or "horizontal"
theme.bar_size                = user.bar_size ~= nil    and user.bar_size * theme.resolution
                                or (theme.bar_type == "vertical" and 4.5 * theme.resolution) 
                                or 3.825 * theme.resolution
theme.wibar_bg                = theme.bg_normal
theme.wibar_fg                = theme.fg_normal
-- tasklist settings
theme.tasklist_plain_task_name   = true
theme.tasklist_disable_icon      = false
theme.tasklist_disable_task_name = true
theme.tasklist_align             = "center"
theme.tasklist_bg_normal         = theme.bg_normal
theme.tasklist_bg_focus          = theme.blk
theme.tasklist_bg_urgent         = theme.fg_urgent
-- taglist settings
theme.taglist_bg_focus           = theme.cya_d
theme.taglist_bg_occupied        = theme.wht
theme.taglist_bg_empty           = theme.gry
theme.taglist_bg_urgent          = theme.fg_urgent
-- systray
theme.systray_max_rows        = 1
theme.systray_icon_spacing    = dpi(theme.useless_gap / 2)

-- Titles
---------
theme.titles_enabled          = true
if user.title_enable ~= nil then
   theme.titles_enabled = user.title_enable
end

theme.titles_size             = user.titles_size ~= nil  and user.titles_size * theme.resolution 
                                or 3 * theme.resolution

theme.titles_inverted         = false
if user.title_invert ~= nil then
   theme.titles_inverted = user.title_invert
end

theme.titles_position         = user.titles_pos ~= nil   and user.titles_pos   or "top"
theme.titles_orientation      = user.titles_side ~= nil  and user.titles_side  or "start"
theme.titles_type             = (theme.titles_position == "left" or theme.titles_position == "right") and "vertical" or "horizontal"
theme.titlebar_font           = theme.ui_font .. "Bold " .. dpi(theme.resolution)
theme.titlebar_bg_focus       = theme.blk
theme.titlebar_fg_focus       = theme.gry
theme.titlebar_bg_normal      = theme.lbg
theme.titlebar_fg_normal      = theme.blk
theme.titlebar_bg_urgent      = theme.fg_urgent
theme.titlebar_fg_urgent      = theme.red_d
-- tabbar
theme.tabbar_bg_normal        = theme.titlebar_bg_normal
theme.tabbar_fg_normal        = theme.titlebar_fg_normal
theme.tabbar_bg_focus         = theme.titlebar_bg_focus
theme.tabbar_fg_focus         = theme.titlebar_fg_focus
theme.tabbar_size             = dpi(theme.titles_size)
theme.tabbar_position         = theme.titles_position == "top" and "bottom" or "top"
theme.mstab_bar_padding       = theme.rounded_clients and dpi(theme.useless_gap) or 0
theme.mstab_border_radius     = theme.rounded_clients and dpi(theme.border_radius) or 0

-- Dashboard
------------
theme.dashboard_size          = user.dash_size ~= nil and user.dash_size * theme.resolution 
                                or 75 * theme.resolution

-- Notifications
----------------
theme.notification_position   = user.notif_pos  ~= nil and user.notif_pos 
                                or (theme.bar_position == "left"   and "top_right")
                                or (theme.bar_position == "right"  and "top_left")
                                or (theme.bar_position == "top"    and "bottom_right")
                                or (theme.bar_position == "bottom" and "top_right")
theme.notif_size              = user.notif_size ~= nil and user.notif_size * theme.resolution 
                                or 9 * theme.resolution
theme.notification_padding    = dpi(theme.useless_gap * 4)
theme.notification_spacing    = dpi(theme.notification_padding / 2)
theme.notification_accent     = theme.grn

-- Scratchpad
-------------
theme.scratchpad_width        = user.scratch_high ~= nil and user.scratch_wide * theme.resolution * theme.aspect_ratio
                                or 40 * theme.resolution * theme.aspect_ratio
theme.scratchpad_height       = user.scratch_high ~= nil and user.scratch_high * theme.resolution
                                or 66 * theme.resolution

-- Layouts
----------
theme.gap_single_client       = true
theme.master_width_factor     = 0.56
theme.layout_tile             = gc.recolor_image(awes_dir .. "tilew.png",       theme.fg_normal)
theme.layout_tileleft         = gc.recolor_image(awes_dir .. "tileleftw.png",   theme.fg_normal)
theme.layout_tilebottom       = gc.recolor_image(awes_dir .. "tilebottomw.png", theme.fg_normal)
theme.layout_tiletop          = gc.recolor_image(awes_dir .. "tiletopw.png",    theme.fg_normal)
theme.layout_fairv            = gc.recolor_image(awes_dir .. "fairvw.png",      theme.fg_normal)
theme.layout_floating         = gc.recolor_image(awes_dir .. "floating.png",    theme.fg_normal)
theme.layout_fairh            = gc.recolor_image(awes_dir .. "fairhw.png",      theme.fg_normal)
theme.layout_cornernw         = gc.recolor_image(awes_dir .. "cornernww.png",   theme.fg_normal)
theme.layout_cornerne         = gc.recolor_image(awes_dir .. "cornernew.png",   theme.fg_normal)
theme.layout_cornersw         = gc.recolor_image(awes_dir .. "cornersww.png",   theme.fg_normal)
theme.layout_cornerse         = gc.recolor_image(awes_dir .. "cornersew.png",   theme.fg_normal)

-- Menu
-------
theme.menu_font               = theme.ui_font .. "Bold " .. dpi(theme.resolution)
theme.menu_height             = dpi(theme.resolution * 3.5)
theme.menu_width              = dpi(theme.menu_height * 5)
theme.menu_fg_focus           = theme.fg_focus
theme.menu_bg_focus           = theme.bg_focus
theme.menu_fg_normal          = theme.fg_normal
theme.menu_bg_normal          = theme.bg_normal
theme.menu_border_color       = theme.bg_focus
theme.menu_border_width       = theme.border_width
theme.menu_submenu_icon       = gc.recolor_image(asst_dir .. "menu_expand.svg", theme.fg_focus)

-- Tooltip
----------
theme.tooltip_bg              = theme.bg_focus
theme.tooltip_fg              = theme.fg_normal
theme.tooltip_font            = theme.font
theme.tooltip_shape           = gears.shape.rounded_rect

-- Snap
-------
theme.snap_bg                 = theme.taglist_bg_focus
theme.snap_border_width       = dpi(theme.titles_size / 2)
theme.snap_shape              = gears.shape.rectangle

return theme
