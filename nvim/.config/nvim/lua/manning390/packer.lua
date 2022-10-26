-- Only required if you have packer configured as `opt`
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Manages itself

	use	{
		'numToStr/Comment.nvim', -- Comment toggling
		config = function() require('Comment').setup() end
	}
	use {
  		'nvim-lualine/lualine.nvim', -- Bottom status bar
  		 requires = { 'kyazdani42/nvim-web-devicons'}
	}
	use 'sheerun/vim-polyglot' -- Syntax library
	use 'tpope/vim-fugitive' -- Git integration
	use {
		'lewis6991/gitsigns.nvim', -- Async git signs
		config = function() require('gitsigns').setup() end
	}
 	-- Color scheme
	use 'haystackandroid/snow'
	use 'arcticicestudio/nord-vim'

	use {
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup{
			fast_wrap = {}
		}  end
	}

	use 'rcarriga/nvim-notify' -- Good notifications

	use 'tpope/vim-abolish' -- Better substitutions and iabbrev

	-- Common dependencies
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-fzy-native.nvim'

	-- Worktrees
	use {
		'ThePrimeagen/git-worktree.nvim',
		config = function()
			require'git-worktree'.setup({ })
		end
	}

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
	use {
		'hrsh7th/nvim-cmp',
		requires = { 'onsails/lspkind.nvim' }
	}
	-- Auto complete sources
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-nvim-lua' -- neovim lua api
	use 'hrsh7th/cmp-cmdline'
	use 'mattn/emmet-vim'
	use 'saadparwaiz1/cmp_luasnip'

	-- Testing
	use {
  		"nvim-neotest/neotest",
  		requires = {
    		"nvim-lua/plenary.nvim",
    		"nvim-treesitter/nvim-treesitter",
    		"antoinemadec/FixCursorHold.nvim",
    		-- Adapters
    		'haydenmeade/neotest-jest',
  		},
  		config = function()
  			require("neotest").setup({
				adapters = {
					require("neotest-jest")({ -- still WIP, probably won't work
						-- ./node_modules/.bin/jest --bail --config ./src/test/js/jest.unit.js --runInBand --coverage=false -- src/test/js/pages/clinics/new.test.tsx
						jestCommand = './node_modules/.bin/jest --runInBand --coverage=false --bail --',
						jestConfigFile = './src/test/js/jest.unit.js'
					}),
				}
  			})
  		end
	}

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

	if packer_bootstrap then
        require('packer').sync()
    end

end, {

})

