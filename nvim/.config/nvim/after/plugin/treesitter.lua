require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"help",
 		"lua",
 		"vim",
 		"http",
 		"json",
 		"typescript",
 		-- "tsx",
 		"scss",
 		"html",
 		"python",
 		"bash",
 		"c",
 		"cpp",
 		"php",
 		"svelte",
 	},
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
	sync_install = true,
	auto_install = true,
	context_commentstring = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similiar to targets.vim,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
        			['ac'] = '@class.outer',
        			['ic'] = '@class.inner',
        			['if'] = '@function.inner',
        			['af'] = '@function.outer',
        			['ia'] = '@parameter.inner',
        			['aa'] = '@parameter.outer',
			}
		}
	},
    	move = {
      		enable = true,
      		set_jumps = true, -- whether to set jumps in the jumplist
      		goto_next_start = {
        		[']m'] = '@function.outer',
        		[']]'] = '@class.outer',
      		},
      		goto_next_end = {
        		[']M'] = '@function.outer',
        		[']['] = '@class.outer',
      		},
      		goto_previous_start = {
        		['[m'] = '@function.outer',
        		['[['] = '@class.outer',
      		},
      		goto_previous_end = {
        		['[M'] = '@function.outer',
        		['[]'] = '@class.outer',
      		},
    	},
}
