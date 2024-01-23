local opts = {}
local plugins = {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				enabled = true, -- eventual nix override
			},
			{
				"williamboman/mason-lspconfig.nvim",
				enabled = true, -- eventual nix override
			},
			{ -- Lsp notification library
				"j-hui/fidget.nvim",
				opts = {
					-- notification = {
					-- 	configs = {
					-- 		default = vim.tbl_extend(
					-- 			"force",
					-- 			require("fidget.notification").default_config,
					-- 			{ icon_on_left = true }
					-- 		),
					-- 	},
					-- },
				},
			},
			{
				"folke/neodev.nvim",-- Additional lua information
				-- config = function()
				-- 	require('neodev').setup({
				-- 		library = { plugins = {"neotest"}, types = true},
				-- 	})
				-- end
			},
		},
	},
	{
		"creativenull/efmls-configs-nvim", -- configurations for efm lang, installed via mason
		version = "v1.x.x",          -- tag is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{ -- PHP Actions
		"gbprod/phpactor.nvim",
		tag = "v1.0.1",
		lazy = true,
		ft = "php",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function()
			require("phpactor").setup({
				install = {
					path = vim.fn.stdpath("data") .. "/lazy/phpactor",
					branch = "2023.09.24.0",
					bin = vim.fn.stdpath("data") .. "/lazy/phpactor/bin/phpactor",
					php_bin = "php",
					composer_bin = "composer2",
					git_bin = "git",
					check_on_startup = "none",
				},
				lspconfig = {
					enabled = false,
					options = {},
				},
			})
		end
	},
	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			{
				"dcampos/cmp-emmet-vim",
				dependencies = {
					{
						"mattn/emmet-vim",
						config = function()
							vim.g.user_emmet_leader_key = "<C-Z>"
						end,
					},
				}
			},
			"saadparwaiz1/cmp_luasnip",
			-- 'hrsh7th/cmp-cmdline',
			-- 'hrsh7th/cmp-nvim-lsp-signature-help',
			-- 'onsails/lspkind.nvim',
		},
	},
	-- Highlight, edit, navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
		},
	},
	-- Git
	"tpope/vim-fugitive", -- :G commands
	"tpope/vim-rhubarb", -- :GBrowse
	"gitsigns-nvim",   -- Sidebar signs

	-- Theme
	"nvim-lualine/lualine.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = false },
	-- 'haystackandroid/snow'
	"shaunsingh/nord.nvim",
	-- Utils
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { scope = { enabled = false } },
	},
	{ -- Comment toggling
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- Our lord and savior
	"tpope/vim-abolish",                           -- Better substitutions and iabbrev
	"tpope/vim-eunuch",                            -- :Rename and :SudoWrite
	"tpope/vim-repeat",                            -- bracket mappings
	"tpope/vim-sleuth",                            -- Detect tabstop and shiftwidth auto
	"tpope/vim-surround",                          -- Surround operator
	"tpope/vim-unimpaired",                        -- bracket mappings
	-- No bindings or cmds by default, make telescope command?
	{ "Vonr/align.nvim",             branch = "v2" }, -- Align things vertically
	{                                              -- Jump to keypairs via labels
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"jghauser/mkdir.nvim", -- Write non-existing folders with :w :e etc.
	{
		"windwp/nvim-autopairs",
		opts = {
			fast_wrap = {},
		},
	},
	{"karb94/neoscroll.nvim", opts = {}}, -- Smooth scroll
	{
		"ku1ik/vim-pasta",
		config = function()
			vim.g.pasta_disabled_filetypes = { "fugitive" }
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"danielvolchek/tailiscope.nvim",   -- Tailwind
	"crispgm/telescope-heading.nvim",  -- Markdown headers etc.
	"dhruvmanila/browser-bookmarks.nvim", -- Browser bookmarks

	-- Harpoo"n
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		opts = {
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	'ThePrimeagen/git-worktree.nvim',

	-- Rest Client
	{
		"rest-nvim/rest.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			result_split_in_place = true,
		},
	},

	-- Testing
	{
		"klen/nvim-test",
		config = function()
			require("nvim-test.runners.jest"):setup({
				args = { "--config=./src/test/js/jest.config.js", "--coverage=false", "--verbose=false" },
			})
			require("nvim-test").setup({
				silent = true,
				term = "terminal",
				termOpts = {
					direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
					-- go_back = true,
					stopinsert = true,
					keep_one = true,
				},
			})
		end,
	},
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
 --    		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-neotest/neotest-jest",
	-- 	},
	-- 	config = function()
	-- 		require('neotest').setup({
	-- 			adapters = {
	-- 				require('neotest-jest')({
	-- 					jestConfigFile = "./src/test/js/jest.config.ts"
	-- 				})
	-- 			}
	-- 		})
	-- 	end
	-- },

	{
		"ron89/thesaurus_query.vim",
		config = function()
			-- vim.g.tq_language={'en'}
			vim.g.tq_openoffice_en_file = "~/Documents/MyThes-1.0/th_en_US_new"
			vim.g.tq_enabled_backends = { "openoffice_en", "datamuse_com" }
		end,
	},
}

-- Bootstrap & Install --
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
-- Run --
require("lazy").setup(plugins, opts)
