call plug#begin(g:configPath . '/plugged')
Plug 'manning390/vim-colemak-DHm' " Colemak keyboard support

Plug 'scrooloose/nerdcommenter' " Toggle comments
Plug 'vimwiki/vimwiki' " Keep notes in vim wiki
Plug 'nvim-lualine/lualine.nvim' " Bottom status bar
Plug 'kyazdani42/nvim-web-devicons' " Dev icons

Plug 'mattn/emmet-vim' " HTML emmet
Plug 'sheerun/vim-polyglot' " syntax library
Plug 'nathanaelkane/vim-indent-guides' " Intend guides
Plug 'tpope/vim-fugitive' " Git integration

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Harpoon
Plug 'ThePrimeagen/harpoon'

Plug 'ncm2/float-preview.nvim'
Plug 'windwp/nvim-autopairs' " Adds auto surround and deletion
Plug 'tpope/vim-eunuch' " Adds various commands
Plug 'markonm/traces.vim' " Adds preview for substitutions

Plug 'airblade/vim-gitgutter' " Git gutters
Plug 'qpkorr/vim-bufkill' " Close buffers without warnings
Plug 'vim-utils/vim-man' " View man pages in vim
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak' " Remaps S to two char search
Plug 'Yggdroot/indentLine'

" Godot
Plug 'habamax/vim-godot'

" Color themes
Plug 'nightsense/snow' " Color scheme

" Writing
Plug 'junegunn/goyo.vim' " Distraction free mode
Plug 'junegunn/limelight.vim' " Highlight current paragraph, useful in goyo
Plug 'reedes/vim-pencil' " Better word wrapping for writing
Plug 'dbmrq/vim-ditto' " Highlight repeated words
Plug 'reedes/vim-litecorrect' " Slightly autocorrect words, liek tihs
Plug 'reedes/vim-lexical' " Better spell check
Plug 'reedes/vim-wordy'

" Autocompletion
Plug 'neovim/nvim-lspconfig' " Native lsp
"Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'} " LSP autocomplete integration
Plug 'hrsh7th/cmp-buffer',   {'branch': 'main'} " Buffer autocomplete integration
Plug 'hrsh7th/cmp-path',     {'branch': 'main'} " Path autocomplete integration
Plug 'hrsh7th/cmp-cmdline',  {'branch': 'main'} " Cmdline autocomplete integration
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'} " LSP autocomplete integration
Plug 'folke/trouble.nvim', {'branch': 'main'} " LSP diagnostics results

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

"
" Plugin configurations
"

lua require('manning390')
runtime! plug-config/colemakdhm.vim
runtime! plug-config/vimwiki.vim
"runtime! plug-config/lsp.vim
"runtime! plug-config/telescope.vim
runtime! plug-config/preview.vim
runtime! plug-config/nerdcommenter.vim

lua require'nvim-autopairs'.setup{}

