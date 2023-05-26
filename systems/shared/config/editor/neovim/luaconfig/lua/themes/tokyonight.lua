
vim.opt.termguicolors = true
vim.o.background = 'dark'
require('tokyonight').setup({
   style = 'night',
   styles = {
      comments = { italic = true },
      keywords = { italic = true }
   }
})
vim.cmd('colorscheme tokyonight')
