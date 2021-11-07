local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
	install_path})
end

return require('packer').startup(function()
	-- Colorschemes
	use 'rmehri01/onenord.nvim'
	use 'Siphalor/vim-atomified'
	use 'Yggdroot/duoduo'
	use 'ajmwagar/vim-deus'
	use 'arcticicestudio/nord-vim'
	use 'blerins/flattown'
	use 'chase/focuspoint-vim'
	use 'flrnd/candid.vim'
	use 'flrnprz/plastic.vim'
	use 'lithammer/vim-eighties'
	use 'mhartington/oceanic-next'
	use 'rhysd/vim-color-spring-night'
	use 'rhysd/wallaby.vim'
	use 'sainnhe/archived-colors'
	use 'sainnhe/edge'
	use 'sainnhe/sonokai'
	use 'sainnhe/vim-color-forest-night'
	use 'scwood/vim-hybrid'
	use 'tjammer/blayu.vim'
	use 'L3MON4D3/LuaSnip'

	-- Icons

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzy-native.nvim', run='make'},
			{'nvim-telescope/telescope-media-files.nvim'}
		},
		config = function() require('telescope').load_extension('fzy_native') end,
	}

	-- Git
	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- LSP and completion
	use 'neovim/nvim-lspconfig'

	-- Completion
	use {
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
	}
	use {
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
	}
	use {
		'hrsh7th/cmp-nvim-lsp',
		after = 'nvim-cmp'
	}
	use {
		'hrsh7th/cmp-buffer',
		after = 'nvim-cmp'
	}
	use {
		'hrsh7th/cmp-path',
		after = 'nvim-cmp'
	}
	use {
		'hrsh7th/cmp-cmdline',
		after = 'nvim-cmp'
	}
	use {
		'hrsh7th/cmp-vsnip',
		after = 'nvim-cmp'
	}
	use {
		'hrsh7th/vim-vsnip',
		after = 'nvim-cmp'
	}

	-- Live errors
	use {
		'folke/trouble.nvim',
		after = 'nvim-web-devicons',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- Statusline
	use {
		'famiu/feline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('feline').setup() end,
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
		branch = "0.5-compat",
		event = "BufRead", 
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "maintained",
				highlight = { enable = true },
			}
		end,
	}

	-- Helpers
	vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
	]])

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
