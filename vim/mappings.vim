let mapleader = ';'

nnoremap , ;

" Files
    nnoremap <Leader>vf :e ~/.config/nvim/functions.vim<CR>
    nnoremap <Leader>vm :e ~/.config/nvim/mappings.vim<CR>
    nnoremap <Leader>vr :e ~/.config/nvim/workrc.vim<CR>
    nnoremap <Leader>vp :e ~/.config/nvim/plugins.vim<CR>

" Editing
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

" Search
    nmap <silent> <leader>/ :set invhlsearch<CR>
    nmap <silent> <leader><space> :set invhlsearch <CR>
