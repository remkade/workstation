local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	-- Colorschemes/Themes
	'Siphalor/vim-atomified',
	'Yggdroot/duoduo',
	'ajmwagar/vim-deus',
	'arcticicestudio/nord-vim',
	'blerins/flattown',
	'chase/focuspoint-vim',
	'flrnd/candid.vim',
	'flrnprz/plastic.vim',
	'folke/tokyonight.nvim',
	'jacoborus/tender.vim',
	'lithammer/vim-eighties',
	'mhartington/oceanic-next',
	'rhysd/vim-color-spring-night',
	'rhysd/wallaby.vim',
	'rmehri01/onenord.nvim',
	'sainnhe/archived-colors',
	'sainnhe/edge',
	'sainnhe/sonokai',
	'sainnhe/vim-color-forest-night',
	'scwood/vim-hybrid',
	'tjammer/blayu.vim',

	-- Mini modules
	{ 'echasnovski/mini.nvim', version = '*' },
	{ 'echasnovski/mini.ai', version = '*' },
	{ 'echasnovski/mini.operators', version = '*' },
	{ 'echasnovski/mini.surround', version = '*' },
	{ 'echasnovski/mini.bracketed', version = '*' },
	{ 'echasnovski/mini.animate', version = '*' },

	-- Telescope
	'stevearc/dressing.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzy-native.nvim', run='make'},
			{'nvim-telescope/telescope-media-files.nvim'}
		},
		config = function() require('telescope').load_extension('fzy_native') end,
	},
	{
		'folke/todo-comments.nvim',
		require = { 'nvim-lua/plenary.nvim' },
		config = function() require('todo-comments').setup() end,
	},

	-- Sessions
	{
		'Shatur/neovim-session-manager',
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function() require('session_manager').setup({}) end,
	},

	-- Git
	{
		'TimUntersberger/neogit',
		dependencies = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
		config = function() require('neogit').setup {} end,
	},

	-- LSP and completion
	'neovim/nvim-lspconfig',

	{
		"hrsh7th/nvim-cmp",
		config = function() require('cmp_config') end,
	},

	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{
		'L3MON4D3/LuaSnip',
		-- follow latest release.
		version = "v1.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	},
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'rafamadriz/friendly-snippets' },

	-- Live errors
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function() require('trouble').setup {} end
	},

	-- Buffer Line
	{
		'akinsho/bufferline.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
		config = function() require("bufferline").setup() end
	},

	-- Help for commands
	{"folke/which-key.nvim"},

	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		event = "BufRead", 
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = "all",
				highlight = { enable = true },
			}
		end
	},

	-- NvimTree
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = 'kyazdani42/nvim-web-devicons',
	},

	-- Statusline
	{
	    'nvim-lualine/lualine.nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Tabnine
	{
		'codota/tabnine-nvim',
		run = './dl_binaries.sh',
	},

	-- Shell Check
	'itspriddle/vim-shellcheck',

	-- Sorting functions :Sort
	'sQVe/sort.nvim',

	-- surround
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end
	},
}
return require('lazy').setup(plugins)
