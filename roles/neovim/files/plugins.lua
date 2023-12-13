local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
	install_path})
end

return require('packer').startup(function()
	-- Colorschemes/Themes
	use 'Siphalor/vim-atomified'
	use 'Yggdroot/duoduo'
	use 'ajmwagar/vim-deus'
	use 'arcticicestudio/nord-vim'
	use 'blerins/flattown'
	use 'chase/focuspoint-vim'
	use 'flrnd/candid.vim'
	use 'flrnprz/plastic.vim'
	use 'folke/tokyonight.nvim'
	use 'jacoborus/tender.vim'
	use 'lithammer/vim-eighties'
	use 'mhartington/oceanic-next'
	use 'rhysd/vim-color-spring-night'
	use 'rhysd/wallaby.vim'
	use 'rmehri01/onenord.nvim'
	use 'sainnhe/archived-colors'
	use 'sainnhe/edge'
	use 'sainnhe/sonokai'
	use 'sainnhe/vim-color-forest-night'
	use 'scwood/vim-hybrid'
	use 'tjammer/blayu.vim'

	-- Telescope
	use 'stevearc/dressing.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzy-native.nvim', run='make'},
			{'nvim-telescope/telescope-media-files.nvim'}
		},
		config = function() require('telescope').load_extension('fzy_native') end,
	}

	use {
		'folke/todo-comments.nvim',
		require = { 'nvim-lua/plenary.nvim' },
		config = function() require('todo-comments').setup() end,
	}

	-- Sessions
	use {
		'Shatur/neovim-session-manager',
		requires = {'nvim-lua/plenary.nvim'},
		config = function() require('session_manager').setup({}) end,
	}

	-- Git
	use {
		'TimUntersberger/neogit',
		requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
		config = function() require('neogit').setup {} end,
	}

	-- LSP and completion
	use 'neovim/nvim-lspconfig'

	use {
		"hrsh7th/nvim-cmp",
		config = function() require('cmp_config') end,
	}

	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use {
		'L3MON4D3/LuaSnip',
		-- follow latest release.
		tag = "v1.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	}
	use { 'saadparwaiz1/cmp_luasnip' }
	use { 'rafamadriz/friendly-snippets' }

	-- Live errors
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require('trouble').setup {} end
	}

	-- Buffer Line
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require("bufferline").setup() end
	}

	-- Help for commands
	use {"folke/which-key.nvim"}

	-- Tree sitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		event = "BufRead", 
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = "all",
				highlight = { enable = true },
			}
		end,
	}

	-- NvimTree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	-- Statusline
	use {
		'famiu/feline.nvim',
		-- after = 'nvim-treesitter/nvim-treesitter',
		requires = 'kyazdani42/nvim-web-devicons',
		setup = function() require('feline_ibhagwan') end,
	}

	-- Tabnine
	use {
		'codota/tabnine-nvim',
		run = './dl_binaries.sh',
		config = function()
		end
	}

	-- Shell Check
	use 'itspriddle/vim-shellcheck'

	-- Sorting functions :Sort
	use 'sQVe/sort.nvim'

	-- surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
