vim.g.mapleader=","
vim.opt.termguicolors = true

require('plugins')
require('lsp')

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>lua require("telescope.builtin").find_files()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<Cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<Cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<Cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fr', '<Cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fd', '<Cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fe', '<Cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', opts)

function randomObjectFromTable(t)
	return t[math.random(1, #t)]
end

local schemes = {
	'OceanicNext',
	'atomified',
	'blayu',
	'candid',
	'cryslominsa',
	'deus',
	'duoduo',
	'edge',
	'flattown',
	'focuspoint',
	'hybrid',
	'nord',
	'onenord',
	'plastic',
	'sonokai',
	'spring-night',
	'wallaby',
        'forest-night'
}

local scheme = randomObjectFromTable(schemes)

vim.cmd('colorscheme ' .. scheme)
