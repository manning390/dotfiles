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

  " Disable command mode
  nnoremap <silent> Q <nop>

" Config navigation hotkeys
    nnoremap <leader>vf :e ~/.config/nvim/functions.vim<CR> " Custom functions and commands
    nnoremap <leader>vm :e ~/.config/nvim/mappings.vim<CR> " Keymappings
    nnoremap <leader>vr :e ~/.config/nvim/general.vim<CR> " General Settings
    nnoremap <leader>vp :e ~/.config/nvim/plugins.vim<CR> " Plugin installation
    nnoremap <leader>vl :e .vimlocal.vim<CR> " Local configs
    nnoremap <leader>vc :PlugConfig<SPACE>
    nnoremap <silent> <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Telescope
  nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
  nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
  nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

  nnoremap <leader>pw :lua require('telescope.builtin').grep_string(({ search = vim.fn.expand("<cword>")}))<CR>
  nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>

" Compe
  inoremap <silent><expr> <C-Space> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Fugitive
  nmap <leader>gs :G<CR>
  nmap <leader>gc :G commit<CR>
  nmap <leader>gp :G push<CR>
  if g:colemak_dhm_automap
    nmap <leader>gn :diffget //3<CR>
    nmap <leader>gt :diffget //2<CR>
  else
    nmap <leader>gj :diffget //3<CR>
    nmap <leader>gf :diffget //2<CR>
  endif

" Editing
  " Jump to the end of the of a line and insert the character there instead
    inoremap ;; <ESC>A;<ESC>
    inoremap ,, <ESC>A,<ESC>
    " inoremap ::: <ESC>A:<ESC>

    " Bypass delete buffer when pasting over selection
    vnoremap <leader>p "_dP

    " make Y yank till end of line
    nnoremap Y y$

    " Yank to clipboard
    nnoremap <leader>y "+y
    vnoremap <leader>y "+y

    " Fix cursor position on visual yanks
    " vnoremap <expr>y "my\"" . v:register . "y`y"

    " Skip buffer on delete
    nnoremap <leader>d "_d
    vnoremap <leader>d "_d

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " Swap carat and 0, default behavior on second press
    nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

    " show whitespace
    nnoremap <F5> :set invlist!<CR>

    " custom case toggling
    nnoremap <silent> ~ :silent call CustomCaseToggle()<CR>

" Search
  " No highlight!!!
  nmap <silent> <leader>/ :noh<CR>
  nmap <silent> <Esc><Esc> :noh<CR>

" Navigation
  nmap <leader>ff [I:let nr = input("which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

  " Close buffer without deleteing pane
  " cnoreabbrev bd BD
  " cnoreabbrev bW BW
  " cnoreabbrev bun BUN
  map <leader>q :bd<CR>

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
  nmap <silent>gk <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

  " Buffer jumping
  nnoremap <silent> gb :BufferLinePick<CR>
  for i in range(1,9)
    execute 'nnoremap <leader>'.i.' :lua require"bufferline".go_to_buffer('.i.')<CR>'
  endfor
  nnoremap <leader>0 :lua require"bufferline".go_to_buffer(10)<CR>

" Deoplete Autocomplete
    " When enter is pressed within a popup menu, will take the selected option and apply it, otherwise normal CR behavior
    inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    " Manual autocomplete trigger
    inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" Comments
  vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Undotree
  nnoremap <leader>u :UndotreeToggle<CR>

" Turn of highlight when opening files
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
