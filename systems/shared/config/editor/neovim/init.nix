_:''
-- Basics
---------
vim.o.number        = true
vim.wo.cursorline   = true
vim.o.showmatch     = true
vim.o.hlsearch      = true
vim.o.incsearch     = true
vim.o.clipboard     = 'unnamedplus'
vim.o.syntax        = 'on'
vim.g.termguicolors = true

-- Set tabbing to 3 spaces:
vim.o.tabstop       = 3
vim.o.shiftwidth    = 3
vim.o.softtabstop   = 0
vim.o.expandtab     = true
vim.bo.smartindent  = true
vim.bo.autoindent   = true

-- Shut up, nvim
vim.o.backup        = false
vim.bo.swapfile     = false

-- Plugin Configuration
-----------------------
-- Just need to be started
require('colorizer').setup()

-- Lualine
require('lualine').setup({
  options = {
      component_separators = { left = ' ', right = ' ' },
      section_separators   = { left = ' ', right = ' ' },
      icons_enabled        = true
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

-- Tree
require('nvim-tree').setup({
  view = {
    adaptive_size = false,
    mappings = { list = {
      { key = "u", action = "dir_up" }
    } }
  },
  renderer = { group_empty = true },
  filters  = { dotfiles = true }
})
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(31, 'FileTree')
    end
  end
})
vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.api'.set_offset(0)
    end
  end
})

-- Commenting
require('nvim-treesitter.configs').setup({
  context_commentstring = { enable = true, enable_autocmd = false }
})
require('Comment').setup({
    pre_hook = function(ctx)
        local U = require('Comment.utils') local location = nil
        if ctx.ctype == U.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
        end
        return require('ts_context_commentstring.internal').calculate_commentstring {
            key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
            location = location
        }
    end
})

-- Keybindings
--------------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Show/Hide tree
map("n", "<A-n>",":NvimTreeToggle<cr>", opts)
-- Move to previous/next tab
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next tab
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Kill current buffer
map('n', '<A-c>', '<Cmd>BufferClose!<CR>', opts)
-- Window split rebinds
map('n', '<A-b>', '<Cmd>split<CR>', {})
map('n', '<A-v>', '<Cmd>vsplit<CR>', {})
map('n', '<A-h>', '<Cmd>wincmd h<CR>', {})
map('n', '<A-j>', '<Cmd>wincmd j<CR>', {})
map('n', '<A-k>', '<Cmd>wincmd k<CR>', {})
map('n', '<A-l>', '<Cmd>wincmd l<CR>', {})
''
