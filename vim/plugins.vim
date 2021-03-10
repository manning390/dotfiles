call plug#begin(g:configPath . '/plugged')

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
" Plug 'machakann/vim-sandwich' " Adds 'surround' motion (s)
Plug 'jiangmiao/auto-pairs' " Adds auto surround and deletion
Plug 'tpope/vim-eunuch' " Adds various commands
Plug 'markonm/traces.vim' " Adds preview for substitutions
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale' " Error indicators from ale with lightline
Plug 'airblade/vim-gitgutter' " Git gutters
Plug 'qpkorr/vim-bufkill'
Plug 'vim-utils/vim-man' " View man pages in vim
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion' " Jump to target

" Color themes
Plug 'rafi/awesome-vim-colorschemes' " color schemes
Plug 'nightsense/snow' " Color scheme

call plug#end()

"
" Plugin configurations
"
runtime! plug-config/vimwiki.vim
runtime! plug-config/lightline.vim
runtime! plug-config/deoplete.vim
runtime! plug-config/ale.vim
runtime! plug-config/fzf.vim
runtime! plug-config/easymotion.vim
runtime! plug-config/nerdcommenter.vim


