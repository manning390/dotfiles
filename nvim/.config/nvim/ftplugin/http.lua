require('manning390.utils')

vim.g.mapleader = "'"

-- Run
nnoremap('<Space>', function() require'rest-nvim'.run() end )
-- Run
nnoremap('<S-Space>', function() require'rest-nvim'.last() end )
-- Preview
nnoremap('<C-Space>', function() require('rest-nvim').run(true) end)

