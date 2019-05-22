runtime! functions.vim
runtime! plugins.vim
runtime! mappings.vim

" General
  syntax on
  filetype plugin indent on
  set noexpandtab
  set copyindent
  set preserveindent
  set softtabstop=0
  set shiftwidth=4
  set tabstop=4

" UI
  set background=dark
  let g:lightline = { 'colorscheme': 'snow_dark' }
  colorscheme snow
  set number
  set relativenumber
  set showmatch
  set cursorline
  set title
  set noshowmode
  set laststatus=2

