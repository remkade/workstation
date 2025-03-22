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
	'arcticicestudio/nord-vim',
	'blerins/flattown',
	'folke/tokyonight.nvim',
	'mhartington/oceanic-next',
	'rmehri01/onenord.nvim',
	'sainnhe/edge',
	'sainnhe/sonokai',
	'tjammer/blayu.vim',
	'BrunoCiccarino/nekonight.nvim',

	-- Mini modules
	{ 'echasnovski/mini.nvim' },
	{ 'echasnovski/mini.ai', config = function() require('mini.ai').setup() end  }, -- Text objects
	{ 'echasnovski/mini.comment', config = function() require('mini.comment').setup() end  },
	{ 'echasnovski/mini.operators', config = function() require('mini.operators').setup({ exchange = { prefix = 'ge', reindent_linewise = true }}) end },
	{ 'echasnovski/mini.surround', config = function() require('mini.surround').setup() end },
	{ 'echasnovski/mini.bracketed', config = function() require('mini.bracketed').setup() end },
	{ 'echasnovski/mini.notify', config = function() require('mini.notify').setup() end },
	{ 'echasnovski/mini.pairs', config = function() require('mini.pairs').setup() end },
	{ 'echasnovski/mini.doc', config = function() require('mini.doc').setup() end },

	-- Get better at VIM
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = { disable_mouse = false }
	},

	-- Telescope
	'stevearc/dressing.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzy-native.nvim', run='make'},
			{'nvim-telescope/telescope-media-files.nvim'}
		},
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
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function() require('trouble').setup {} end
	},

	-- Buffer Line
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
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

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	-- NvimTree
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = 'nvim-tree/nvim-web-devicons',
	},

	-- Statusline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup{ theme = 'nekonight' }
		end
	},

	-- AI CodeCompanion
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require('codecompanion_config').config()
		end
	}

	-- Shell Check
	'itspriddle/vim-shellcheck',

	-- Sorting functions :Sort
	'sQVe/sort.nvim',

	-- Quick search
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	-- PlantUML
	'aklt/plantuml-syntax'
}
return require('lazy').setup(plugins)
