vim.g.mapleader=" "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.wo.relativenumber = true
vim.o.foldlevel = 4

require('plugins')
require('lsp_setup')
require('colorscheme')
require('which')
require('treesitter')

require('nvim-tree').setup()

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
