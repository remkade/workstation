vim.g.mapleader=","
vim.opt.termguicolors = true
vim.opt.foldlevelstart = 4

require('plugins')
require('lsp')
require('colorscheme')
require('which')
require('treesitter')
require('tabnine_config')

require('nvim-tree').setup()
