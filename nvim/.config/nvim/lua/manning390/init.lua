vim.g.mapleader      = "'"
vim.g.maplocalleader = "'"
-- vim.g.localmapleader = '\\'
-- vim.keymap.set('', ' ', '\\')


if vim.env.COLEMAK == '1' then
	vim.g.keymaps = {
		h = 'm',
		j = 'n',
		k = 'e',
		l = 'i',
		n = 'h',
		N = 'H',
		f = 't',
	}
else
	vim.g.keymaps = {
		h = 'h',
		j = 'j',
		k = 'k',
		l = 'l',
		n = 'n',
		N = 'N',
		f = 'f',
	}
end

-- require'manning390.packer'
require'manning390.lazy'
require'manning390.set'
require'manning390.keymap'
require'manning390.commands'
require'manning390.autocmd'
require'manning390.telescope'

-- local project level settings
local ok, _ = pcall(dofile, './.nvim/init.lua')
-- if ok then
--     print('local settings loaded')
-- end

print('Leader is ' .. vim.g.mapleader)
