runtime! functions.vim
runtime! plugins.vim
runtime! mappings.vim

" General
	set nocompatible
	filetype plugin indent on
	syntax on

	set tabstop=4 " A tab if four spaces
	set autoindent " always set autoindenting on
	set copyindent " copy the previos indentation on autoindenting
	set noexpandtab " don't convert tabs to spaces (default off)
	set preserveindent " preserves original tabs or spaces in use
	set softtabstop=0
	set shiftwidth=4 " number of spaces to use for autoindenting
	set shiftround " use multiple of siftwidth when indenting with '<' and '>'

	let &directory=g:configPath .'/swap//' " set where we're saving swaps
	let &undodir=g:configPath .'/undo//' " and undos

	set backspace=indent,eol,start " allow backspacing over everything in insert mode

	set sidescroll=1 " sidescroll when needed
	set nowrap " don't wrap lines

	set hidden " hides buffers rather than closing them when not active
	set laststatus=2 " Ensures lightline shows up
	set showtabline=2 " Ensures tabline shows up

" UI
	set background=dark " used by snow
	colorscheme snow " color scheme
	let g:lightline.colorscheme = 'snow_dark' " lightline match colorscheme
	set number " Show line numbers
	set relativenumber " Relative line numbers
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

" Search
    set hlsearch " highlight search terms
    set incsearch " show search matches as you type
    set ignorecase " ignore case when searching
    set smartcase " ignore case if search pattern is all lowercase

" Auto commands (run functions/snippets)
	autocmd BufWritePre * call StripTrailingWhitespace() " after save on every file trim trailing whitespace
	autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
