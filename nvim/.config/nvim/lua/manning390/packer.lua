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
			{
				'j-hui/fidget.nvim',
				tag = 'legacy',
				config = function()
					require 'fidget'.setup {
						text = {
							spinner = 'dots'
						}
					}
				end
			},
			-- Additional lua configuration
			'folke/neodev.nvim'
		},
	}
	-- Auto complete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-calc',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			'mattn/emmet-vim',
			'saadparwaiz1/cmp_luasnip',
			-- 'hrsh7th/cmp-cmdline',
			-- 'hrsh7th/cmp-nvim-lsp-signature-help',
			-- 'onsails/lspkind.nvim',
		}
	}

	-- Highlight, edit, navigate code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		requires = {
			'JoosepAlviste/nvim-ts-context-commentstring',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/playground',
		}
	}

	-- Git reload plugins
	use 'tpope/vim-fugitive' -- Git integration
	use 'tpope/vim-rhubarb'
	use {
		'lewis6991/gitsigns.nvim', -- Async git signs
		config = function()
			require('gitsigns').setup {
				-- signs = {
				-- 	-- add = { text = '+' },
				-- 	-- change = { text = '~' },
				-- 	-- delete = { text = '_' },
				-- 	-- topdelete = { text = '‾' },
				-- 	-- changedelete = { text = '~' },
				-- }
			}
		end
	}

	use 'nvim-tree/nvim-web-devicons'

	-- Bottom status bar
	use {
		'nvim-lualine/lualine.nvim',
	}

	-- Color scheme
	-- use 'haystackandroid/snow'
	use 'shaunsingh/nord.nvim'

	use { 'lukas-reineke/indent-blankline.nvim',
		config = function() require('indent_blankline').setup { char = '┊', show_trailing_blankline_indent = false, } end }
	use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end } -- Comment toggling

	use 'tpope/vim-abolish'                                                          -- Better substitutions and iabbrev
	use 'tpope/vim-eunuch'                                                           -- :Rename and :SudoWrite
	use 'tpope/vim-repeat'                                                           -- bracket mappings
	use 'tpope/vim-sleuth'                                                           -- Detect tabstop and shiftwidth auto
	use 'tpope/vim-surround'                                                         -- Surround operator
	use 'tpope/vim-unimpaired'                                                       -- bracket mappings
	use 'jessarcher/vim-heritage'                                                    -- Create new directories on edit file in non-existent dir

	-- use 'sheerun/vim-polyglot' -- Syntax library
	use {
		'whatyouhide/vim-textobj-xmlattr',
		requires = 'kana/vim-textobj-user'
	}

	-- Telescope
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { "nvim-lua/plenary.nvim" } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Harpoo"n
	use {
		"ThePrimeagen/harpoon",
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
		config = function()
			require("nvim-autopairs").setup {
				fast_wrap = {}
			}
		end
	}

	-- Smooth scrolling
	use {
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup()
		end
	}

	-- Fix pasting indents
	use {
		'sickill/vim-pasta',
		config = function()
			vim.g.pasta_disabled_filetypes = { 'fugitive' }
		end
	}

	-- Array helpers
	-- gS to turn 1 line into array
	-- gJ to turn multiline array to one line
	-- Breaks with current join line mapping
	-- use {
	-- 	'AndrewRadev/splitjoin.vim',
	-- 	config = function()
	-- 		vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
	-- 		vim.g.splitjoin_trailing_comma = 1
	-- 		vim.g.splitjoin_php_method_chain_full = 1
	-- 	end
	-- }

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
		'manning390/nvim-test',
		config = function()
			require('nvim-test.runners.jest'):setup {
				args = {"--config=./src/test/js/jest.config.js", "--coverage=false", "--verbose=false" },
			}
			require('nvim-test').setup {
				silent = true,
				termOpts = {
    				direction = "horizontal",   -- terminal's direction ("horizontal"|"vertical"|"float")
					-- go_back = true,
					keep_one = true,
				},
			}
		end
	}

	use {
		'phpactor/phpactor',
		ft = 'php',
		run = 'composer install --no-dev --optimize-autoloader',
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

-- Automatically source and re-compile packer whenever you save packer
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	group = vim.api.nvim_create_augroup('packer', { clear = true }),
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	pattern = '*packer.lua',
})
