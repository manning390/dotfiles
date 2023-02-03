M = {
	-- Writing
	use {
		'preservim/vim-pencil', -- Better word wrapping for writing
		as = 'writing',
		ft = {'md', 'mkd', 'markdown', 'wiki', 'tex'},
		config = function()
			vim.cmd[[PencilSoft]]
			vim.call[[litecorrect#init()]]
			vim.call[[lexical#init()]]
			vim.cmd[[DittoOn]]
			vim.o.spell = true
			require('notify')('Writing Mode On', 'info', {render = 'minimal'})
		end,
		requires = {
			{'dbmrq/vim-ditto'}, -- Highlight repeated words
		 	{'preservim/vim-litecorrect'}, -- Slightly autocorrect words, liek tihs
			{'preservim/vim-lexical'}, -- Better spell check
			{'preservim/vim-wordy'}, -- Grammar check
		}
	}
}
return M
