----------------------
-- UI Configuration --
----------------------

-- Load scheme wrapper library.
local scheme = require('lib.scheme')

-- Lualine
----------
-- initialize vars for schemes
local lualine_theme = nil

-- if a scheme is not bundled with lualine, look for a theme file
if scheme.is_lualine_default == false then
	lualine_theme = require('themes.lualine.' .. scheme.scheme)
else
	lualine_theme = scheme.scheme
end

-- lualine setup config
require('lualine').setup({
	options = {
		section_separators = { 
			left  = scheme.lualine_style_left, 
			right = scheme.lualine_style_right 
		},
		component_separators = { 
			left  = scheme.lualine_seperator_left, 
			right = scheme.lualine_seperator_right 
		},
		theme = lualine_theme
	},
	sections = {
		lualine_a = { "mode" },
    	lualine_b = { "branch", "diff", "diagnostics" },
    	lualine_c = { " " },
    	lualine_x = { " " },
    	lualine_y = { "encoding" },
    	lualine_z = { "location" }
  	}
})

-- Tabline
----------
require('tabline').setup({
	-- Defaults configuration options
	enable  = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		section_separators = { 
			scheme.tabline_style_left, 
			scheme.tabline_style_right 
		},
		component_separators = { 
			scheme.tabline_seperator_left, 
			scheme.tabline_seperator_right 
		},
 		-- Shows base filename only instead of relative path in filename.
		show_filename_only = true
	}
})

-- Tree
-------
require('nvim-tree').setup {
	disable_netrw = true,
	renderer = {
		indent_markers = {
			enable 		  = true
		},
		icons = {
			symlink_arrow = ' >> '
		},
		highlight_git    = true,
		add_trailing     = true,
		group_empty      = true
	},
	git = {
	   ignore  = false,
	   timeout = 500
	},
	trash = {
	   cmd = "trash"
	}
}
