call plug#begin(g:configPath . '/plugged')

Plug 'nightsense/snow'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'mattn/emmet-vim'
Plug 'vim-vdebug/vdebug', { 'for': 'php' }
Plug 'janko-m/vim-test'
Plug 'phpactor/phpactor', { 'for': 'php', 'do': 'composer install' }
Plug 'editorconfig/editorconfig-vim'
"Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'markonm/traces.vim'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-sandwich'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'calviken/vim-gdscript3'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

"Plug 'kristijanhusak/deoplete-phpactor'

call plug#end()

"runtime! macros/matchit.vim

set rtp+=/usr/bin/fzf

let g:ale_fixers = {
\   'php': [ 'php_cs_fixer' ],
\}

let g:ale_linters = {
\ 'php': ['php', 'phpcs', 'phpmd'],
\ }

let g:ale_fix_on_save = 1
let g:ale_php_phpcs_standard = 'phpcs_ruleset.xml'
let g:php_cs_fixer_config_file = '.php_cs'

let g:deoplete#enable_at_startup = 1
let g:vdebug_options = {"break_on_open": 0}
"let test#strategy = "fat_runner"
let g:phpactorPhpBin = '/usr/bin/php'
"let g:test#custom_strategies = {'fat_runner': function('FatRunnerStrategy')}
"let g:UltiSnipsSnippetsDir = g:configPath . '/UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
