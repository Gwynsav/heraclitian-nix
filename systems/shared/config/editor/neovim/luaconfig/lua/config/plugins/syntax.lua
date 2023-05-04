--------------------------
-- Syntax Configuration --
--------------------------

-- Treesitter
-------------
local custom_parser_dir = "~/.local/share/nvim/parsers"

require('nvim-treesitter.configs').setup({
	-- Install languages synchronously (only applied to `ensure_installed`).
	sync_install = false,

	-- List of parsers to ignore installing.
	ignore_install = {},

	highlight = {
		-- `false` will disable the whole extension.
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate 
		-- highlights. Instead of true it can also be a list of languages.
		additional_vim_regex_highlighting = false
	},

	parser_install_dir = custom_parser_dir
})
vim.opt.runtimepath:append(custom_parser_dir)

-- Colorizer
------------
require('colorizer').setup(nil, { names = false })
