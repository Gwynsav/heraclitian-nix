---------------------------
-- Keybind Configuration --
---------------------------

local function map(mode, bind, exec, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, bind, exec, opts)
end

local function unmap(mode, bind)
	vim.api.nvim_del_keymap(mode, bind)
end

local opt = {} --empty opt for maps with no extra options
local M   = {}

--[[
    MAPPING:
	map takes 4 args:
		The first is the type, whether in all, normal, insert etc. 
		(reference: https://github.com/nanotee/nvim-lua-guide#defining-mappings)
		The Second Arg is the keybind. Just like normal vim way
		The Third is the command to execute
		The Fourth is other extra options
	Example:  (toggles line numbers)
		map("n", "<C-n>", ":set rnu!<CR>", opt)
--]]

-- Misc Binds
vim.g.mapleader      = ' ' -- Map leader key to space
vim.g.maplocalleader = '<A>'
map('', 	'<C-t>', 	  ':NvimTreeToggle<CR>', opt) 				   -- toggle nvimtree
map('',  '<C-c>',      ':CommentToggle<CR>',  opt)                -- toggle comment
map('n', '<leader>nf', ':Neoformat<CR>',      { noremap = true }) -- format current buffer with neoformat
map('n', '<leader>~',  ':Alpha<CR>',          opt) 					-- map show dashboard

-- clipboard mappings
map('n', '<leader>ya', ':%y+<CR>', opt) -- Copy content of entire buffer to system clipboard
map('n', '<leader>yl', '"+yy',     opt) -- yank current line into system clipboard

-- write buffer changes
map('n', 'WW', ":w<CR>", opt)

-- Autocompletion mappings for cmp
local cmp = require('cmp')
M.cmp_mappings = {
	['<Tab>']     = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<S-Tab>']   = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-d>']     = cmp.mapping.scroll_docs(-4),
	['<C-f>']     = cmp.mapping.scroll_docs(4),
	['<C-e>']     = cmp.mapping.close(),
	['<CR>']      = cmp.mapping.confirm({
							 behavior = cmp.ConfirmBehavior.Insert,
							 select   = true,
						 }),
}

-- Buffer management
map('n', '<leader>.', ':bn<CR>', { noremap = true })
map('n', '<leader>,', ':bp<CR>', { noremap = true })
map('n', '<leader>c', ':bd<CR>', { noremap = true })
map('n', '<leader>b', ':sp<CR>', opt)
map('n', '<leader>v', ':vs<CR>', opt)

-- Window navigation
map('n', '<leader>h', ':wincmd h<CR>', opt)
map('n', '<leader>j', ':wincmd j<CR>', opt)
map('n', '<leader>k', ':wincmd k<CR>', opt)
map('n', '<leader>l', ':wincmd l<CR>', opt)

-- Terminal commands
map('n', '<leader><CR>', ':vs | terminal<CR>i', opt)
map('n', '<leader>\\',   ':sp | terminal<CR>i', opt)
map('t', '<C-esc>',      '<C-\\><C-n>',         opt)

-- Telescope pullup
map('n', '<leader>ff', ':Telescope find_files<CR>',   { noremap = true })
map('n', '<leader>fh', ':Telescope oldfiles<CR>',     { noremap = true })
map('n', '<leader>fw', ':Telescope live_grep<CR>',    { noremap = true })
map('n', '<leader>fg', ':Telescope git_commits<CR>',  { noremap = true })
map('n', '<leader>fG', ':Telescope git_branches<CR>', { noremap = true })
map('n', '<leader>fe', ':lua require(\'telescope.builtin\').symbols({ sources = { \'kaomoji\'}})<CR>', { noremap = true })

map('n', '<leader>s', ':Telescope buffers<CR>', opt)

-- returns any externally-required keymaps for usage
return M
