local cab = (vim.fn.filereadable(vim.fn.expand('~/.github-handles.json')) == 1) and
	fmt('Co-Authored-By: {}', {
		i(1, '@handle'),
	}) or
	fmt('Co-Authored-By: {} <{}@{}>', {
		i(1, 'Name'),
		i(2, 'user'),
		i(3, 'github.com'),
	})
return {
	s({ trigger = 'cab', desc = 'Co-Authored-By' }, cab),
}
