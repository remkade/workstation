vim.g.mapleader=","

require('plugins')
require('lsp')

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

local opts = { noremap=true, silent=true }
buf_set_keymap('n', '<leader>ff', '<Cmd>lua require("telescope.builtin").find_files()<cr>', opts)
buf_set_keymap('n', '<leader>fg', '<Cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
buf_set_keymap('n', '<leader>fb', '<Cmd>lua require("telescope.builtin").buffers()<cr>', opts)
buf_set_keymap('n', '<leader>fh', '<Cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
