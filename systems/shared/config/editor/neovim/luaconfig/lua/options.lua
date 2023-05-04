--------------------------------
-- Vanilla NVIM Configuration --
--------------------------------

-- Useful variables
local o   = vim.o
local opt = vim.opt

-- Basics
o.number        = true
o.cursorline    = true
o.mouse         = 'a'
o.showmatch     = true
o.clipboard     = 'unnamedplus'
o.syntax        = 'on'
opt.scrolloff   = 8

-- Set tabbing to 3 spaces:
o.tabstop       = 3
o.shiftwidth    = 3
o.softtabstop   = 0
o.expandtab     = true
o.smartindent   = true
o.autoindent    = true

-- Modeline
o.modeline      = true
o.modelines     = 5
opt.ruler       = false

-- Searching
o.incsearch     = true
o.hlsearch      = true
opt.ignorecase  = true

-- Splitting
opt.splitbelow  = true
opt.splitright  = true
o.completeopt   = 'menuone,noselect'

-- Shut up, nvim
o.errorbells    = false
opt.backup      = false
opt.swapfile    = false

-- Necessary for basically every colorscheme plugin ever.
opt.termguicolors = true
