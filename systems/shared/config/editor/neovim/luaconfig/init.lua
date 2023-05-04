-----------------------------
-- Main Configuration File --
-----------------------------
-- (This is literally nii-nvim)

require('keymap')
require('options')

vim.cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]])

local scheme = require('lib.scheme')
scheme.load_shared_scheme('oxocarbon')
scheme.load_global_style({' ', ' '}, {'|', '|'})

-- I disabled LSP because all it did was throw errors. You'll need to
-- uncomment some lines in `config.plugins` to re-enable its config.
-- require('config.lsp')
require('config.plugins')
