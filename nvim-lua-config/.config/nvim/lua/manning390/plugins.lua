return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Manages itself

	use	{
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}
	use 'nvim-lualine/lualine.nvim' -- Bottom status bar
	use 'kyazdani42/nvim-web-devicons' -- Dev icons
	use 'sheerun/vim-polyglot' -- Syntax library
	use 'tpope/vim-fugitive' -- Git integration
	use 'lewis6991/gitsigns.nvim' -- Async git signs
	use 'nightsense/snow' -- Color scheme

	-- Common dependencies
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-treesitter/nvim-treesitter'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-fzy-native.nvim'

	-- Harpoo"n
	use {
		'ThePrimeagen/harpoon',
		config = function()
			require'harpoon'.setup({
				global_settings = { save_on_change = true }
			})
		end
	}

	-- Lsp Stuff
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use 'folke/trouble.nvim'

	-- Auto complete
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-nvim-lua' -- neovim lua api
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'mattn/emmet-vim'
	use 'hrsh7th/nvim-cmp'

	-- LuaSnip
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'


end)

