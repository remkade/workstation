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
		'Shatur/neovim-session-manager',
		requires = {'nvim-lua/plenary.nvim'},
		config = function() require('session_manager').setup({}) end,
	}

	-- Git
	use {
		'TimUntersberger/neogit',
		requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
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
		config = function() require('cmp_config') end
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

	use {
		'L3MON4D3/LuaSnip',
		config = function()
			local present, luasnip = pcall(require, "luasnip")
			   if not present then
			      return
			   end

			   luasnip.config.set_config {
				   history = true,
				   updateevents = "TextChanged,TextChangedI",
			   }

			   -- require("luasnip/loaders/from_vscode").load { paths = {} }
			   require("luasnip/loaders/from_vscode").load()
		   end,
	   }

	-- Live errors
	use {
		'folke/trouble.nvim',
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
		branch = "0.5-compat",
		event = "BufRead", 
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "maintained",
				highlight = { enable = true },
			}
		end,
	}

	-- Statusline
	use {
		'famiu/feline.nvim',
		-- after = 'nvim-treesitter/nvim-treesitter',
		requires = 'kyazdani42/nvim-web-devicons',
		setup = function() require('feline_ibhagwan') end,
	}


	use { 
		"nvim-neorg/neorg",
		config = function()
			require('neorg').setup {
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
					config = {
						workspaces = {
							my_workspace = "~/neorg"
						}
					}
				}
			},
		}
		end,
		requires = "nvim-lua/plenary.nvim"
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
