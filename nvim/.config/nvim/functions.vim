" Makes %% abbreviation which expands to current buffer path
cabbrev <expr> %% expand('%:p:h')

" Trips whitespace by vim replace
" Saves cursor position before exec and returns it
function! StripTrailingWhitespace()
    let _s=@/ " Preparation: save last search, and cursor position
    let l = line('.')
    let c = col('.')
    " do the business:
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

command! Tab2Space :set expandtab | ret!<CR>
cabbrev t2s Tab2Space

command! Space2Tab :set noexpandtab | ret!<CR>
cabbrev s2t Space2Tab

command! Whitespace :set invlist!<CR>

" Bind to keys so that the fist press does the first arg, the second press
" does a the second arg
function! ToggleMovement(firstOp, thenOp)
    let pos = getpos('.')
    execute 'normal! ' . a:firstOp
    if pos == getpos('.')
        execute 'normal! ' . a:thenOp
    endif
endfunction

" FZF + vim
command! -bang -nargs=? -complete=file GitFiles :call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right'))

" Make substitute something I can remember
cabbrev sub substitute

" Shortcut to plugin configurations
command! -nargs=1 -complete=customlist,ListPlugConfigs PlugConfig execute ':e ~/.config/nvim/plug-config/'. <q-args> .'.vim'
function! ListPlugConfigs(A,L,P)
    return map(globpath('~/.config/nvim/plug-config/', '**'.a:A.'*.vim', 0, 1), "fnamemodify(v:val, ':t:r')")
endfunction

" Tells us if we're in a git tree, helpful for specific mappings
function! IsInGitTree()
    silent! !git rev-parse --is-inside-work-tree
    return v:shell_error == 0
endfunction

" Simply lets you jump to the nearest fold, uses jk chars for direction
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! CustomCaseToggle()
    let char = getline('.')[col('.') - 1]
    if char == '-'
        normal! "_r_
        normal! l
    elseif char == '_'
        normal! "_r-
        normal! l
    else
        normal! ~
    endif
endfunction
