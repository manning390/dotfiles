let mapleader = ';'

nnoremap , ;

" Files
    nnoremap <leader>vf :e ~/.config/nvim/functions.vim<CR>
    nnoremap <leader>vm :e ~/.config/nvim/mappings.vim<CR>
    nnoremap <leader>vr :e ~/.config/nvim/workrc.vim<CR>
    nnoremap <leader>vp :e ~/.config/nvim/plugins.vim<CR>

	" CtrlP doesn't index files in .gitignore
    map <C-p> :GitFiles<CR>
    nnoremap <leader>yf :let @+ = expand("%")<CR> " copy file path

" Editing
	" Jump to the end of the of a line and insert the character there instead
    inoremap ;; <ESC>A;<ESC>
    inoremap ,, <ESC>A,<ESC>
    inoremap ::: <ESC>A:<ESC>

    " make Y yank till end of line
    nnoremap Y y$

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

	" Swap carat and 0, default behavior on second press
    nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
    nnoremap <silent> , :call ToggleMovement(',', ';')<CR> " Not sure if this works given my leader
    nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
    nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>
    nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
    nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

    " Fix cursor position on visual yanks
 	 vnoremap <expr>y "my\"" . v:register . "y`y"

" Search
	nmap <silent> <leader>/ :noh<CR>
	nmap <silent> <leader><space> :noh<CR>
	nnoremap <silent> <Esc><Esc> <Esc>:noh<CR>

    nnoremap <leader>ss :SideSearch <C-R><C-w><CR> | wincmd p

" Navigation
	nnoremap <leader>b :Buffers<CR>
	nmap <leader>ff [I:let nr = input("which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

	map <leader>q :bp<bar>bd #<CR> " Close buffer without deleteing pane

	" Move around panes
	map <C-l> <C-w>l
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k

	" Ale jumping
	nmap <silent> gd :ALEGoToDefinition<CR>
	nmap <silent> gf :ALEFindReferences
	nmap <silent> gh :ALEHover

	" Buffer jumping
	nmap <leader>1 <Plug>lightline#bufferline#go(1)
	nmap <leader>2 <Plug>lightline#bufferline#go(2)
	nmap <leader>3 <Plug>lightline#bufferline#go(3)
	nmap <leader>4 <Plug>lightline#bufferline#go(4)
	nmap <leader>5 <Plug>lightline#bufferline#go(5)
	nmap <leader>6 <Plug>lightline#bufferline#go(6)
	nmap <leader>7 <Plug>lightline#bufferline#go(7)
	nmap <leader>8 <Plug>lightline#bufferline#go(8)
	nmap <leader>9 <Plug>lightline#bufferline#go(9)
	nmap <leader>0 <Plug>lightline#bufferline#go(10)

" Sidebar
	nmap <leader>kb :NERDTreeToggle<CR>

" Comments
"	nmap <C-/> <Plug>NERDCommenterToggle
"	vmap <C-/> <Plug>NERDCommenterToggle<CR>gv
