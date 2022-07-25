-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
	use 'windwp/nvim-autopairs'

	use 'rcarriga/nvim-notify'

	-- Common dependencies
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

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
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-nvim-lua' -- neovim lua api
	use 'hrsh7th/cmp-cmdline'
	use 'mattn/emmet-vim'
	use 'saadparwaiz1/cmp_luasnip'

	-- LuaSnip
	use 'L3MON4D3/LuaSnip'

	-- Writing
	use {
		'preservim/vim-pencil', -- Better word wrapping for writing
		as = 'writing',
		ft = {'md', 'mkd', 'markdown', 'wiki', 'tex'},
		config = function()
			vim.cmd[[PencilSoft]]
			vim.call[[litecorrect#init()]]
			vim.call[[lexical#init()]]
			vim.cmd[[DittoOn]]
			vim.o.spell = true
			require('notify')('Writing Mode On', 'info', {render = 'minimal'})
		end,
		requires = {
			{'dbmrq/vim-ditto'}, -- Highlight repeated words
		 	{'preservim/vim-litecorrect'}, -- Slightly autocorrect words, liek tihs
			{'preservim/vim-lexical'}, -- Better spell check
			{'preservim/vim-wordy'}, -- Grammar check
		}
	}

end, {

})

