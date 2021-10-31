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
	use 'kyazdani42/nvim-web-devicons'

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzy-native.nvim'}
		},
		config = function() require('telescope').load_extension('fzy_native') end,
	}

	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim'
	}

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- For vsnip users.
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
	]])

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons"
	}

	use {"folke/which-key.nvim"}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
