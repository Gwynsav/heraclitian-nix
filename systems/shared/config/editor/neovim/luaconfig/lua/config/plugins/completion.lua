----------------------------------
-- Autocompletion Configuration --
----------------------------------

local cmp    = require('cmp')
local keymap = require('keymap')

-- CMP
------
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn['UltiSnips#Anon'](args.body)
		end,
	},
	mapping = keymap.cmp_mappings,
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', priority = 1 },
		{ name = 'ultisnips' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	}),
})

-- Autopairing
--------------
require('nvim-autopairs').setup({
	disable_filetype = { 'telescopeprompt', 'vim' },
})
