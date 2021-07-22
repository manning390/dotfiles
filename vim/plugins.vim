call plug#begin(g:configPath . '/plugged')
Plug 'manning390/vim-colemak-DHm' " colemak keyboard support

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " File sidebar
Plug 'scrooloose/nerdcommenter' " Toggle comments
Plug 'itchyny/lightline.vim' " Bottom status bar
Plug 'mengelbrecht/lightline-bufferline' " Buffer tabline with lightline
Plug 'mattn/emmet-vim' " HTML emmet
Plug 'sheerun/vim-polyglot' " syntax library
Plug 'nathanaelkane/vim-indent-guides' " Intend guides
Plug 'junegunn/fzf', { 'dir': '~/.dotfiles/fzf', 'do': './install --all' } " Fuzzy search files
Plug 'manning390/fzf.vim' " Vim integration for previous plugin, forked for customizations
Plug 'tpope/vim-fugitive' " Git integration
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
Plug 'jiangmiao/auto-pairs' " Adds auto surround and deletion
Plug 'tpope/vim-eunuch' " Adds various commands
Plug 'markonm/traces.vim' " Adds preview for substitutions
Plug 'neovim/nvim-lspconfig' " Neovim native LSP configs
" Plug 'dense-analysis/ale'
" Plug 'maximbaz/lightline-ale' " Error indicators from ale with lightline
Plug 'airblade/vim-gitgutter' " Git gutters
Plug 'qpkorr/vim-bufkill'
Plug 'vim-utils/vim-man' " View man pages in vim
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion' " Jump to target

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
runtime! plug-config/vimwiki.vim
runtime! plug-config/lightline.vim
runtime! plug-config/lsp.vim
runtime! plug-config/deoplete.vim
runtime! plug-config/preview.vim
" runtime! plug-config/ale.vim
runtime! plug-config/fzf.vim
runtime! plug-config/easymotion.vim
runtime! plug-config/nerdcommenter.vim
runtime! plug-config/rainbow.vim

