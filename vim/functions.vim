" Trips whitespace by vim replace
" Saves cursor position before exec and returns it
function! StripTrailingWhitespace()
	let _s=@/ " Preparation: save last search, and cursor position
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

" Refreshes vim when making edits to configs
command! Refresh :so ~/.config/nvim/init.vim
cabbrev re Refresh

" Bind to keys so that the fist press does the first arg, the second press
" does a the second arg
function! ToggleMovement(firstOp, thenOp)
	let pos = getpos('.')
	execute "normal! " . a:firstOp
	if pos == getpos('.')
		execute "normal! " . a:thenOp
	endif
endfunction

" Maps SS to SideSearch
" https://github.com/ddrscott/vim-side-search
cabbrev SS SideSearch

