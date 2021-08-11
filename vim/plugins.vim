call plug#begin(g:configPath . '/plugged')
Plug 'manning390/vim-colemak-DHm' " colemak keyboard support
Plug 'scrooloose/nerdcommenter' " Toggle comments
Plug 'itchyny/lightline.vim' " Bottom status bar
"Plug 'mengelbrecht/lightline-bufferline' " Buffer tabline with lightline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'mattn/emmet-vim' " HTML emmet
Plug 'sheerun/vim-polyglot' " syntax library
Plug 'nathanaelkane/vim-indent-guides' " Intend guides
Plug 'tpope/vim-fugitive' " Git integration

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Autocompletion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'ncm2/float-preview.nvim'
"Plug 'jiangmiao/auto-pairs' " Adds auto surround and deletion
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-eunuch' " Adds various commands
Plug 'markonm/traces.vim' " Adds preview for substitutions
Plug 'neovim/nvim-lspconfig' " Neovim native LSP configs

Plug 'airblade/vim-gitgutter' " Git gutters
" Plug 'kshenoy/vim-signature' " Mark gutters
Plug 'qpkorr/vim-bufkill'
Plug 'vim-utils/vim-man' " View man pages in vim
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak' " Remaps S to two char search
Plug 'Yggdroot/indentLine' " Indent guides

" Clojure
Plug 'Olical/conjure', {'for': 'clojure', 'tag': 'v4.18.0'}
Plug 'luochen1990/rainbow' " Match parentheses with colors
" Plug 'bhurlow/vim-parinfer' " Infers parenthes
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' } " Autocomplete for deoplete
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' } " For slurping parentheses
Plug 'guns/vim-sexp', { 'for': 'clojure' } " Dep for ^
Plug 'tpope/vim-repeat', { 'for': 'clojure' } " Dep for ^
Plug 'tpope/vim-surround', { 'for': 'clojure' } " Dep for ^
Plug 'guns/vim-clojure-highlight'

" Color themes
Plug 'nightsense/snow' " Color scheme

call plug#end()

"
" Plugin configurations
" Type <leader>vc then type the name of the file sans filetype
"
runtime! plug-config/colemakdhm.vim
runtime! plug-config/signature.vim
runtime! plug-config/vimwiki.vim
runtime! plug-config/lightline.vim
runtime! plug-config/lsp.vim
runtime! plug-config/deoplete.vim
runtime! plug-config/preview.vim
runtime! plug-config/telescope.vim
runtime! plug-config/nerdcommenter.vim
runtime! plug-config/rainbow.vim
runtime! plug-config/emmet.vim
lua require('nvim-autopairs').setup{}
runtime! plug-config/bufferline.vim
