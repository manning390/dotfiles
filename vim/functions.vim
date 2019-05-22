function! StripTrailingWhitespace()
	let _s=@/ " Preparation: save last search, and cursor position
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

