call plug#begin(g:configPath . '/plugged')
Plug 'manning390/vim-colemak-DHm' " Colemak keyboard support

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " File sidebar
Plug 'scrooloose/nerdcommenter' " Toggle comments
Plug 'vimwiki/vimwiki' " Keep notes in vim wiki
Plug 'itchyny/lightline.vim' " Bottom status bar
Plug 'mengelbrecht/lightline-bufferline' " Buffer tabline with lightline
Plug 'mattn/emmet-vim' " HTML emmet
Plug 'sheerun/vim-polyglot' " syntax library
Plug 'nathanaelkane/vim-indent-guides' " Intend guides
Plug 'junegunn/fzf', { 'dir': '~/.dotfiles/fzf', 'do': './install --all' } " Fuzzy search files
Plug 'manning390/fzf.vim' " Vim integration for previous plugin, forked for customizations
Plug 'tpope/vim-fugitive' " Git integration
" Autocompletion
Plug 'neovim/nvim-lspconfig' " Native lsp
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-lsp' " Native LSP integration into autocomplete
Plug 'ncm2/float-preview.nvim'
Plug 'jiangmiao/auto-pairs' " Adds auto surround and deletion
Plug 'tpope/vim-eunuch' " Adds various commands
Plug 'markonm/traces.vim' " Adds preview for substitutions
Plug 'airblade/vim-gitgutter' " Git gutters
Plug 'qpkorr/vim-bufkill' " Close buffers without warnings
Plug 'vim-utils/vim-man' " View man pages in vim
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion' " Jump to letters

" Godot
Plug 'habamax/vim-godot'

" Color themes
Plug 'rafi/awesome-vim-colorschemes' " color schemes
Plug 'nightsense/snow' " Color scheme

" C/C++
Plug 'ericcurtin/CurtineIncSw.vim' " Switch between .c and .h buffers

" Writing
Plug 'junegunn/goyo.vim' " Distraction free mode
Plug 'junegunn/limelight.vim' " Highlight current paragraph, useful in goyo
Plug 'reedes/vim-pencil' " Better word wrapping for writing
Plug 'dbmrq/vim-ditto' " Highlight repeated words
Plug 'reedes/vim-litecorrect' " Slightly autocorrect words, liek tihs
Plug 'reedes/vim-lexical' " Better spell check
Plug 'reedes/vim-wordy'
call plug#end()

"
" Plugin configurations
"
runtime! plug-config/colemakdhm.vim
runtime! plug-config/vimwiki.vim
runtime! plug-config/lightline.vim
runtime! plug-config/deoplete.vim
runtime! plug-config/lsp.vim
runtime! plug-config/preview.vim
runtime! plug-config/fzf.vim
runtime! plug-config/easymotion.vim
runtime! plug-config/nerdcommenter.vim

