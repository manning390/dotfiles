" Leader
  if g:colemak_dhm_automap
    let mapleader = "'"
    nnoremap ' <NOP>
  else
    let mapleader = ';'
    nnoremap , ; " Set original ; to , because it's useful
  endif
  let maplocalleader = '\'
  map <space> \
  echom 'Leader is: ' . mapleader

" Config navigation hotkeys
    nnoremap <leader>vf :e ~/.config/nvim/functions.vim<CR> " Custom functions and commands
    nnoremap <leader>vm :e ~/.config/nvim/mappings.vim<CR> " Keymappings
    nnoremap <leader>vr :e ~/.config/nvim/general.vim<CR> " General Settings
    nnoremap <leader>vp :e ~/.config/nvim/plugins.vim<CR> " Plugin installation
    nnoremap <leader>vl :e .vimlocal.vim<CR> " Local configs
    nnoremap <leader>vc :PlugConfig<SPACE>
    nnoremap <leader><CR> :so ~/.config/nvim/init.vim<BAR>:noh<CR>

" Files
    " Telescope
    nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})<CR>
    nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
    nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
    nnoremap <leader>pv :lua require('telescope.builtin').help_tags()<CR>
    nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>

    " Yanking names
    nnoremap <leader>yf :let @+ = expand("%:p")<CR> " copy file path
    nnoremap <leader>yn :let @+ = expand("%:r")<CR> " copy file name

" Editing
  " Jump to the end of the of a line and insert the character there instead
    inoremap ;; <ESC>A;<ESC>
    inoremap ,, <ESC>A,<ESC>
    " inoremap ::: <ESC>A:<ESC>

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
"    nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
"    nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>
"   nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
"   nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

    " Fix cursor position on visual yanks
    vnoremap <expr>y "my\"" . v:register . "y`y"

    " show whitespace
    nnoremap <F5> :set invlist!<CR>

    " custom case toggling
    nnoremap <silent> ~ :silent call CustomCaseToggle()<CR>

" Search
  " No highlight!!!
  nmap <silent> <leader>/ :noh<CR>
  " nmap <silent> <leader><space> :noh<CR>
  " nmap <silent> <Esc><space> :noh<CR>
  nmap <silent> <Esc><Esc> :noh<CR>

" Navigation
  nnoremap <leader>b :Buffers<CR>
  nmap <leader>ff [I:let nr = input("which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

  " Close buffer without deleteing pane
  " cnoreabbrev bd BD
  " cnoreabbrev bW BW
  " cnoreabbrev bun BUN
  map <leader>q :bp<bar>bd #<CR>

  " Move around panes
  execute 'map <C-'.g:left.'> <C-w>h'
  execute 'map <C-'.g:right.'> <C-w>l'
  execute 'map <C-'.g:down.'> <C-w>j'
  execute 'map <C-'.g:up.'> <C-w>k'

  " Quickfix lists
  execute 'nnoremap <silent>g'.g:next.' :cnext<CR>'
  execute 'nnoremap <silent>g'.g:previous.' :cprevious<CR>'
  nnoremap <silent>gq :cclose<CR>

  " Previous and next buffer
  execute 'noremap <A-'.g:up.'> :bp<CR>'
  execute 'noremap <A-'.g:down.'> :bn<CR>'

  " Fold jumping
  execute "nnoremap <silent> <leader>z".g:down." :call NextClosedFold('j')<CR>"
  execute "nnoremap <silent> <leader>z".g:up." :call NextClosedFold('k')<CR>"

  " LSP jumping
  nmap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
  nmap <silent>gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nmap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
  nmap <silent>gk <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

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

" Deoplete Autocomplete
    " When enter is pressed within a popup menu, will take the selected option and apply it, otherwise normal CR behavior
    inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    " Manual autocomplete trigger
    inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" Comments
  vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Undotree
  nnoremap <F6> :UndotreeToggle<CR>

" No Highlight on Open
augroup nohonopen
  au!
  autocmd Filetype * :noh
augroup end

" Clj bindings
augroup cljbindings
  au!
  autocmd Filetype clj
    \  nnoremap <leader>( :RainbowParenthesesToggle<CR>
    \| call RainbowToggleOn
augroup end

" C++ bindings
augroup cppbindings
  au!
  autocmd Filetype cpp map <F4> :call CurtineIncSw()<CR>
augroup end

" Godot bindings
func! GodotSettings() abort
    setlocal foldmethod=manual
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end
