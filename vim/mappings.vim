let mapleader = ';'

nnoremap , ;

nnoremap <leader>deh O<esc>:call ExpandSnippet('deh')<cr>==
nnoremap <leader>weh O<esc>:call ExpandSnippet('weh')<cr>==
nnoremap <Leader>cf :let @+ = expand("%")<CR> " copy file path

" Files: {
    nnoremap <Leader>sp :e ~/scratchpad<CR>

    nnoremap <Leader>vf :e ~/.vim/functions.vim<CR>
    nnoremap <Leader>vm :e ~/.vim/mappings.vim<CR>
    nnoremap <Leader>vr :e ~/.vim/myrc.vim<CR>
    nnoremap <Leader>vp :e ~/.vim/plugins.vim<CR>
" }

" Editing: {
    inoremap ;; <ESC>A;<ESC>
    inoremap ,, <ESC>A,<ESC>
    inoremap ::: <ESC>A:<ESC>

    " Surround in visual/selection mode
    xmap S <Plug>(operator-sandwich-add)

    nnoremap Y y$

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

" MoveLines: {
        nnoremap <C-J> :m .+1<CR>==
        nnoremap <C-K> :m .-2<CR>==
        inoremap <C-J> <Esc>:m .+1<CR>==gi
        inoremap <C-K> <Esc>:m .-2<CR>==gi
        vnoremap <C-J> :m '>+1<CR>gv=gv
        vnoremap <C-K> :m '<-2<CR>gv=gv
    " }
" }

" Navigation: {
    nnoremap <leader>b :Buffers<CR>
    nnoremap <C-p> :Files<CR>
    nnoremap <Leader>fu :BTags<CR>
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
    nnoremap <Leader>ut :UndotreeToggle<CR>

    " Display all lines with keyword under cursor " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" }

" Git: {
    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    nnoremap <leader>dg2 :diffget //2<CR>:diffupdate<CR>
    nnoremap <leader>dg3 :diffget //3<CR>:diffupdate<CR>
    nnoremap <leader>gd :Gvdiff<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
" }

" Testing: {
    nnoremap <leader>ta :w<CR>:TestSuite<CR>
    nnoremap <leader>tf :w<CR>:TestFile<CR>
    nnoremap <leader>tl :w<CR>:TestLast<CR>
    nnoremap <leader>tt :w<CR>:TestNearest<CR>
    nnoremap <leader>tv :w<CR>:TestVisit<CR>
" }

" Search: {
    nmap <silent> <leader>/ :set invhlsearch<CR>
    nmap <silent> <leader><space> :set invhlsearch<CR>
" }

" Sidebar: {
    map <leader>kb :NERDTreeToggle<CR>
" }

" UI: {
"    nnoremap 1<Backspace> :set background=dark<CR>
"    nnoremap 2<Backspace> :set background=light<CR>
" }

" Refactoring: {
    "nnoremap <Leader>u :call phpactor#UseAdd()<CR>
    "nnoremap <Leader>e :call phpactor#ClassExpand()<CR>
    "vnoremap <silent><Leader>em :call phpactor#ExtractMethod()<CR>
    "nnoremap <Leader>pp :call phpactor#ContextMenu()<CR>
    "nnoremap <Leader>o :call phpactor#GotoDefinition()<CR>
    "nnoremap <Leader>pd :call phpactor#OffsetTypeInfo()<CR>
    "nnoremap <Leader>pfm :call phpactor#MoveFile()<CR>
    "nnoremap <Leader>pfc :call phpactor#CopyFile()<CR>
    "nnoremap <Leader>tt :call phpactor#Transform()<CR>
    "nnoremap <Leader>cc :call phpactor#ClassNew()<CR>
    "nnoremap <Leader>fr :call phpactor#FindReferences()<CR>
" }
