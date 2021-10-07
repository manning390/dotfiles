runtime! functions.vim
runtime! plugins.vim
runtime! mappings.vim

" General
	" set nocompatible
	filetype plugin indent on
	syntax on

	set path+=**
	set wildmode=longest,list,full
	set wildmenu
	set wildignore+=**/.git/*
	set wildignore+=**/node_modules/*
	set completeopt=menu,menuone,noselect

	set noerrorbells
	set tabstop=2 " A tab is two spaces
	set softtabstop=2
	set shiftwidth=2 " number of spaces to use for autoindenting
	set expandtab " always convert tabs to spaces
	set smartindent
	set autoindent " always set autoindenting on
	set copyindent " copy the previos indentation on autoindenting
	set preserveindent " preserves original tabs or spaces in use
	set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
	set encoding=UTF-8
	scriptencoding UTF-8

	let &directory=g:configPath .'/swap//' " set where we're saving swaps
    set noswapfile " that said, don't make swaps
    set undofile
	let &undodir=g:configPath .'/undo//' " and undos

	set backspace=indent,eol,start " allow backspacing over everything in insert mode

	set sidescroll=1 " sidescroll when needed
	set nowrap " don't wrap lines

	set hidden " hides buffers rather than closing them when not active
	set laststatus=2 " Ensures lightline shows up
	set showtabline=2 " Ensures tabline shows up

	set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:·
	"set listchars=eol:¶,tab:>·,trail:~,extends:>,precedes:<,space:·

set formatoptions-=ro

	" UI
	" let g:sierra_Twilight = 1
  set termguicolors
	set background=dark
	colorscheme snow " color scheme
	let g:lightline.colorscheme = 'snow_dark' " lightline match colorscheme
	set number relativenumber " Show line numbers Relative line numbers
	set showmatch " show matching parenthesis
	set cursorline " show what line the cursor is on
	set title " show title in window
	set noshowmode " Hides original status line
	set ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd
	set tabpagemax=15
	set splitbelow splitright

	let g:indent_guides_start_level = 2
	let g:indent_guides_guide_size = 1

	set ttimeoutlen=0

" Search
  set hlsearch " highlight search terms
  set incsearch " show search matches as you type
  set smartcase " ignore case if search pattern is all lowercase

" Auto commands (run functions/snippets)
	augroup highlight_yank
    	autocmd!
    	autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
	augroup END

	augroup general
		au!
		autocmd FileType vim setlocal fo-=cro " Stop comment continuation on new lines and autowrapping
  		" Strip trailing whitespace after save on every file
		autocmd BufWritePre * call StripTrailingWhitespace() " after save on every file trim trailing whitespace
		autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
	augroup END

  " Hybrid number lines
  " When in normal mode, relative numbers otherwise normal
  " https://jeffkreeftmeijer.com/vim-number/
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

  " Load project specific settings, don't output error
  " Expects vim to always open at root of project
  " Run last incase we want to overwrite anything
  try
    source .vimlocal.vim
  catch
    " No worries, ignore it
  endtry
