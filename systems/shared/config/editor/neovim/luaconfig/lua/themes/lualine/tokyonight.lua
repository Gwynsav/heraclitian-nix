-- Copyright (c) 2021 Jnhtr
-- MIT license, see LICENSE for more details.
-- LuaFormatter off
local colors = {
	base_fg    = '#1a1b26',
	light_fg   = '#c0caf5',
	secondary  = '#1e2030',
	background = '#1a1b26',
	norm_bg    = '#7dcfff',
	ins_bg     = '#e0af68',
	vis_bg     = '#bb9af7',
	rep_bg     = '#f7768e',
	cmd_bg     = '#9ece6a',
	int_bg     = '#1e2030',
}
--LuaFormatter on
return {
	normal = {
		a = { bg = colors.norm_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	insert = {
		a = { bg = colors.ins_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	visual = {
		a = { bg = colors.vis_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	replace = {
		a = { bg = colors.rep_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	command = {
		a = { bg = colors.cmd_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	inactive = {
		a = { bg = colors.int_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
}
