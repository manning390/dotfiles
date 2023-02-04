-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Package manager, manages itself
	use 'wbthomason/packer.nvim'

	-- Lsp Stuff
	use {
		'neovim/nvim-lspconfig',
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			-- Useful status updates for LSP
			'j-hui/fidget.nvim',
			-- Additional lua configuration
			'folke/neodev.nvim'
		},
	}
	-- Auto complete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			-- 'onsails/lspkind.nvim',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp',
			-- 'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua',
			-- 'hrsh7th/cmp-cmdline',
			'mattn/emmet-vim',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		}
	}

	-- Highlight, edit, navigate code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}
	-- Additional text objects via tree sitter
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter'
	}

	-- Git reload plugins
	use 'tpope/vim-fugitive' -- Git integration
	use 'tpope/vim-rhubarb'
	use {
		'lewis6991/gitsigns.nvim', -- Async git signs
		config = function() require('gitsigns').setup {
				signs = {
					-- add = { text = '+' },
					-- change = { text = '~' },
					-- delete = { text = '_' },
					-- topdelete = { text = '‾' },
					-- changedelete = { text = '~' },
				}
			}
		end
	}

	-- Color scheme
	use 'shaunsingh/nord.nvim'
	use "EdenEast/nightfox.nvim" 
	use {
		'nvim-lualine/lualine.nvim', -- Bottom status bar
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use { 'lukas-reineke/indent-blankline.nvim',
		config = function() require('indent_blankline').setup { char = '┊', show_trailing_blankline_indent = false, } end }
	use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end } -- Comment toggling
	use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth auto
	use 'tpope/vim-abolish' -- Better substitutions and iabbrev
	-- use 'sheerun/vim-polyglot' -- Syntax library

	-- Telescope
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { "nvim-lua/plenary.nvim" } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Harpoo"n
	use {
		'ThePrimeagen/harpoon',
		config = function()
			require 'harpoon'.setup({
				global_settings = { save_on_change = true }
			})
		end
	}
	-- Worktrees
	use { 'ThePrimeagen/git-worktree.nvim', config = function() require 'git-worktree'.setup() end }


	use {
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {
				fast_wrap = {}
			}
		end
	}

	-- use {
	-- 	'glepnir/lspsaga.nvim',
	-- 	config = function()
	-- 		local status, saga = pcall(require, "lspsaga")
	-- 		if (not status) then return end
	--
	-- 		saga.setup({
	-- 			-- server_filetype_map = {
	-- 			-- 	typescript = 'typescript'
	-- 			-- }
	-- 		})
	-- 	end
	-- }
	-- use 'folke/trouble.nvim'
	use {
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local ok, null_ls = pcall(require, "null-ls")
			if not ok then return end
			require 'null-ls'.setup({
				sources = {
					null_ls.builtins.diagnostics.eslint,
				}
			})
		end,
		requires = { "nvim-lua/plenary.nvim" }
	}


	-- Rest Client
	use {
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		-- config = function()
		-- 		require'rest-nvim'.setup({
		-- result_split_in_place = true,
		-- 		})
		-- 	end
	}

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


	if is_bootstrap then
		require('packer').sync()
	end

end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

-- Automatically source and re-compile packer whenever you save packer
au({ 'BufWritePost' }, {
	group = ag('packer', { clear = true }),
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	pattern = '*packer.lua',
})
