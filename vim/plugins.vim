call plug#begin(g:configPath . '/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " File sidebar
Plug 'scrooloose/nerdcommenter' " Toggle comments
Plug 'vimwiki/vimwiki' " Keep notes in vim wiki
Plug 'itchyny/lightline.vim' " Bottom status bar
Plug 'mengelbrecht/lightline-bufferline' " Buffer tabline with lightline
Plug 'mattn/emmet-vim' " HTML emmet
Plug 'sheerun/vim-polyglot' " syntax library
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'} " typescript syntax
Plug 'nathanaelkane/vim-indent-guides' " Intend guides
Plug 'junegunn/fzf', { 'dir': '~/.dotfiles/fzf', 'do': './install --all' } " Fuzzy search files
Plug 'manning390/fzf.vim' " Vim integration for previous plugin
Plug 'tpope/vim-fugitive' " Git integration
" Autocompletion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
  	Plug 'roxma/nvim-yarp'
  	Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'Shougo/denite.nvim'
Plug 'ddrscott/vim-side-search' " Adds :SideSearch (SS) using ag
Plug 'machakann/vim-sandwich' " Adds 'surround' motion (s)
Plug 'jiangmiao/auto-pairs' " Adds auto surround and deletion to
Plug 'tpope/vim-eunuch' " Adds various commands
Plug 'markonm/traces.vim' " Adds preview for substitutions
" Plug 'w0rp/ale' " Asynchronous Lint Engine
" Plug 'maximbaz/lightline-ale' " Error indicators from ale with lightline
Plug 'airblade/vim-gitgutter' " Git gutters
"Plug 'SirVer/ultisnips' " Snippet engine
Plug 'ryanoasis/vim-devicons'

" Color themes
Plug 'nightsense/snow' " Color scheme
Plug 'rafi/awesome-vim-colorschemes' " color schemes
call plug#end()

"
" Plugin configurations
"

" Lightline settings & integrations
let g:lightline#bufferline#show_number=2 " numbers are ordinal
let g:lightline#bufferline#modified='*' " shows file has been modified
let g:lightline#bufferline#unnamed='[No Name]' " unsaved files are no name
let g:lightline#bufferline#number_seperator='|' " seperator between buffer and name
let g:lightline = {
    \'colorscheme': 'snow_dark'
  \}
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {
  \'buffers': 'lightline#bufferline#buffers',
    \'linter_checking': 'lightline#ale#checking',
    \'linter_warnings': 'lightline#ale#warnings',
    \'linter_errors': 'lightline#ale#errors',
    \'linter_ok': 'lightline#ale#ok',
  \}
let g:lightline.component_type   = {
  \'buffers': 'tabsel',
    \'linter_checking': 'left',
    \'linter_warnings': 'warning',
    \'linter_errors': 'error',
    \'linter_ok': 'left',
  \}
let g:lightline.active = {
  \'left': [['mode','paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
  \'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
  \}
let g:lightline.component_function = { 'gitbranch': 'fugitive#head' }

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {'_': ['ale']} " Use Ale as a source of completion
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete = 1

" Ale settings
" let g:ale_fixers = {
	" \'vimwiki': 'markdown',
  " \'vim': 'vint',
	" \'zsh': 'sh',
	" \'javascript': ['prettier', 'eslint'],
	" \'css': ['prettier'],
" \}
" let g:agle_lint_on_enter = 0
" let g:ale_fix_on_save=1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_completion_tsserver_autoimport = 1

" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Ultisnips settings
let g:UltiSnipsSnippetsDir=g:configPath.'/snips//' " set where we're saving snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical" " :UltiSnipsEdit splits window

" Fzf
let g:fzf_layout = { 'down': '~60%' }

" Comments
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
