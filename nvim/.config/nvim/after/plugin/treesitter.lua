require('nvim-treesitter.configs').setup {
	ensure_installed = { "help", "lua", "vim", "http", "json", "tsx", "scss", "html", "python", "bash" },
	sync_install = true,
	auto_install = true,
	highlight = { enable = true },
	indent    = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection    = '<c-space>',
			node_incremental  = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental  = '<c-backspace>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similiar to targets.vim,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
        		['aa'] = '@parameter.outer',
        		['ia'] = '@parameter.inner',
        		['af'] = '@function.outer',
        		['if'] = '@function.inner',
        		['ac'] = '@class.outer',
        		['ic'] = '@class.inner',
			}
		}
	}
}
