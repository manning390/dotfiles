function bind(op, outer_opts)
	outer_opts = outer_opts or {noremap = true}
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end
function toggleMovement(first, second)
	local pos = table.concat(vim.fn.getpos('.'), ' ')
	vim.cmd('normal! '..first)
	if pos == table.concat(vim.fn.getpos('.'), ' ') then
		vim.cmd('normal! '..second)
	end
end
function customCaseToggle()	
    local p = vim.fn.col('.')
    local char = string.sub(vim.api.nvim_get_current_line(), p, p)
    local seq = ({
        ['-']  = '"_r_l',  -- '-' -> '_'
        ['_']  = '"_r-l',  -- '_' -> '-'
        ['"']  = '"_r\'l', -- etc.
        ["'"]  = '"_r"l',
    })[char]
    vim.cmd('normal! '..(seq or '~'))
end

local map      = bind('')
local nmap     = bind('n', {noremap = false})
local nnoremap = bind('n')
local vnoremap = bind('v')
local xnoremap = bind('x')
local inoremap = bind('i')

vim.g.mapleader = "'"
vim.g.localmapleader = '\\'
vim.keymap.set('', ' ', '\\')
print('Leader is '..vim.g.mapleader)

nmap('<leader>/', ':noh<CR>', {silent =true})
nnoremap('<Esc><Esc>', ':let @/ = ""<CR>', {silent = true}) -- Clear search buffer
nnoremap('Q', '<nop>', {silent = true})
nnoremap('<leader><CR>', function() require('reload') end)
--	" Need to define these so mappings in downstream vimrc can map
--	let bind_to = g:colemak_dhm_automap ? 'dhm' : 'original'
--	let g:left  = get(g:colemak_dhm_mappings.left, bind_to)
--	let g:right  = get(g:colemak_dhm_mappings.right, bind_to)
--	let g:down  = get(g:colemak_dhm_mappings.down, bind_to)
--	let g:up  = get(g:colemak_dhm_mappings.up, bind_to)
--	let g:next  = get(g:colemak_dhm_mappings.next, bind_to)
--	let g:previous  = get(g:colemak_dhm_mappings.previous, bind_to)
if vim.env.COLEMAK == '1' then
	map('m', 'h') -- left
	map('n', 'j') -- down
	map('e', 'k') -- up
	map('i', 'l') -- right
	-- bworked... :(
	-- nnoremap('<C-M>', '<C-W> h') -- change window left
	-- nnoremap('<C-N>', '<C-W> j') -- change window down
	-- nnoremap('<C-E>', '<C-W> k') -- change window up
	-- nnoremap('<C-I>', '<C-W> l') -- change window right
	map('l', 'i') -- insert
	nmap('h', 'n') -- next
	nmap('H', 'N') -- previous
	nmap('k', 'm') -- mark
	nmap('K', 'H') -- top screen
	nmap('N', 'J') -- join
	nmap('I', '<nop>') -- Shift I
end

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
nnoremap('<leader>p/', function()
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

-- Editing
inoremap(';;', '<ESC>A;')
inoremap(',,', '<ESC>A,')

vnoremap('<', '<gv')
vnoremap('>', '>gv')
vnoremap('.', ':normal .<CR>')

nnoremap('Y', 'y$')
nnoremap('0', function() toggleMovement('^', '0') end)
nnoremap('~', function() customCaseToggle() end)
