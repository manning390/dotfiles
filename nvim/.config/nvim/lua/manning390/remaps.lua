function bind(op, outer_opts)
	outer_opts = outer_opts or {noremap = true}
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local map      = bind('')
local nmap     = bind('n', {noremap = false})
local nnoremap = bind('n')
local vnoremap = bind('v')
local xnoremap = bind('x')
local inoremap = bind('i')

vim.g.mapleader = "'"
-- vim.g.localmapleader = '\\'
-- vim.keymap.set('', ' ', '\\')
print('Leader is '..vim.g.mapleader)

nmap('<leader>/', ':noh<CR>', {silent =true})
nnoremap('<enter>', ':let @/ = ""<CR>', {silent = true}) -- Clear search buffer
nnoremap('Q', '<nop>', {silent = true})
nnoremap('<leader><CR>', function() require('reload') end)

local h, j, k, l, n, N, f = 'h', 'j', 'k', 'l', 'n', 'N', 'f'
if vim.env.COLEMAK == '1' then
    h, j, k, l, n, N, f = 'm', 'n', 'e', 'i', 'h', 'H', 't'
	map('m', 'h') -- left
	map('n', 'j') -- down
	map('e', 'k') -- up
	map('i', 'l') -- right
	map('l', 'i') -- insert
	nmap('h', 'n') -- next
	nmap('H', 'N') -- previous
	nmap('k', 'm') -- mark
	nmap('K', 'H') -- top screen
	nmap('N', 'J') -- join
	nmap('I', '<nop>') -- Shift I
end
local sf = string.format
nnoremap(sf('<C-%s>', h), ':wincmd h<cr>', {silent = true}) -- change window left
nnoremap(sf('<C-%s>', j), ':wincmd j<cr>', {silent = true}) -- change window down
nnoremap(sf('<C-%s>', k), ':wincmd k<cr>', {silent = true}) -- change window up
nnoremap(sf('<C-%s>', l), ':wincmd l<cr>', {silent = true}) -- change window right

-- Harpoon
nnoremap('<leader>a', function() require'harpoon.mark'.add_file() end)
nnoremap('<leader>`', function() require'harpoon.ui'.toggle_quick_menu() end)
for i = 1, 9 do
	nnoremap('<leader>'..i, function() require'harpoon.ui'.nav_file(i) end)
end
nnoremap('<leader>tc', function() require'harpoon.cmd-ui'.toggle_quick_menu() end)
nnoremap('<leader>tt', function() require'harpoon.term'.gotoTerminal(1) end)
nnoremap('<leader>ts', function() require'harpoon.term'.gotoTerminal(0) end)

-- Telescope
local mtel = require'manning390.telescope'
local tel = require'telescope.builtin'
nnoremap('<C-p>', function() mtel.project_files() end)
nnoremap('<leader>pf', function() tel.find_files() end)
nnoremap('<leader>pg', function()
	tel.grep_string{ search = vim.fn.input("Grep For > ")} end)
nnoremap('<leader>pw', function()
	tel.grep_string{ search = vim.fn.expand("<cword>")} end)
nnoremap('<leader>pb', function() tel.buffers() end)
nnoremap('<leader>pv', function() mtel.search_dotfiles() end)

-- Lsp
nmap('gd', function() vim.lsp.buf.definition() end, {silent = true})
nmap('gD', function() vim.lsp.buf.declaration() end, {silent = true})
nmap('gr', function() vim.lsp.buf.references() end, {silent = true})
nmap('<leader>h', function() vim.lsp.diagnostic.goto_next() end, {silent = true})
nmap('<leader>H', function()
	vim.lsp.diagnostic.show_line_diagnostics()
	vim.lsp.util.show_line_diagnostics()
end, {silent = true})
-- Snippets
-- local ls = require'luasnip'
-- vim.keymap.set({'i','s'}, "<C-k>", function()
-- 	print(ls.expand_or_jumpable())
-- 	-- if ls.expand_or_jumpable() then
-- 		ls.expand_or_jump()
-- 	-- end
-- end, {silent = true})
-- vim.keymap.set({'i','s'}, "<C-j>", function()
-- 	print('what')
-- 	-- if ls.jumpable(-1) then
-- 		ls.jump(-1)
-- 	-- end
-- end, {silent = true})
-- inoremap("<C-i>", function()
-- 	print('who')
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end)
nnoremap('<leader>s', '<cmd>source ~/.config/nvim/lua/manning390/luasnip.lua<CR>')

-- Quick fix lists
nnoremap('g'..n, ':cnext<cr>',  {silent = true})
nnoremap('g'..N, ':cprev<cr>',  {silent = true})
nnoremap('gq',   ':cclose<cr>', {silent = true})

-- Editing
inoremap(';;', '<ESC>A;')
inoremap(',,', '<ESC>A,')
inoremap('<space><space>', '<ESC>A')

vnoremap('<', '<gv')
vnoremap('>', '>gv')
vnoremap('.', ':normal .<CR>')

nnoremap('Y', 'y$')
nnoremap('0', function() require('manning390.fn').toggleMovement('^', '0') end)
nnoremap('~', function() require('manning390.fn').customCaseToggle() end)

nnoremap('<F4>', function() 
	if vim.fn.expand('%:e') == 'cpp' then
		vim.cmd('find %:t:r.hpp')
	else
		vim.cmd('find %:t:r.cpp')
	end
end)

