-- my custom functions
local fn = require 'manning390.fn'

local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local map            = bind('')
local nmap           = bind('n', { noremap = false })
local nnoremap       = bind('n')
local vnoremap       = bind('v')
--local xnoremap = bind('x')
local inoremap       = bind('i')

vim.g.mapleader      = "'"
vim.g.maplocalleader = "'"
-- vim.g.localmapleader = '\\'
-- vim.keymap.set('', ' ', '\\')
print('Leader is ' .. vim.g.mapleader)

inoremap('<Tab>', '\t')

nmap('<leader>/', ':noh<cr>', { silent = true })
nnoremap('<enter>', ':let @/=""<cr>', { silent = true }) -- Clear search buffer

nnoremap('Q', '<nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<nop>', { silent = true })

nnoremap('<leader><cr>', function() require('reload') end)

-- Setting local variables for qwerty <-> colemak for downsteam mappings
local sf = string.format
local h, j, k, l, n, N, f = 'h', 'j', 'k', 'l', 'n', 'N', 'f'
if vim.env.COLEMAK == '1' then
	h, j, k, l, n, N, f = 'm', 'n', 'e', 'i', 'h', 'H', 't'
	map('m', 'h')   -- left
	map('n', 'j')   -- down
	map('e', 'k')   -- up
	map('i', 'l')   -- right
	map('l', 'i')   -- insert
	nmap('h', 'n')  -- next
	nmap('H', 'N')  -- previous
	nmap('k', 'm')  -- mark
	nmap('K', 'H')  -- top screen
	nmap('N', 'J')  -- join
	nmap('I', '<nop>') -- Shift I
end
nnoremap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nnoremap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

nnoremap(sf('<C-%s>', h), ':wincmd h<cr>', { silent = true }) -- change window left
nnoremap(sf('<C-%s>', j), ':wincmd j<cr>', { silent = true }) -- change window down
nnoremap(sf('<C-%s>', k), ':wincmd k<cr>', { silent = true }) -- change window up
nnoremap(sf('<C-%s>', l), ':wincmd l<cr>', { silent = true }) -- change window right

-- Harpoon
nnoremap('<leader>a', require 'harpoon.mark'.add_file)
nnoremap('<leader>`', require 'harpoon.ui'.toggle_quick_menu)
for i = 1, 9 do
	nnoremap('<leader>' .. i, function() require 'harpoon.ui'.nav_file(i) end)
end
nnoremap('<leader>t`', require 'harpoon.cmd-ui'.toggle_quick_menu)
nnoremap('<leader>tt', function() require 'harpoon.term'.gotoTerminal(1) end)
nnoremap('<leader>ts', function() require 'harpoon.term'.gotoTerminal(0) end)

-- Telescope
local mtel = require 'manning390.telescope'
local tel = require 'telescope.builtin'
nnoremap('<C-p>', mtel.project_files, { desc = 'Search [P]roject' })
nnoremap('<leader><space>', require 'telescope.builtin'.buffers, { desc = '[ ] Find existing buffers' })
nnoremap('<leader>?', require 'telescope.builtin'.oldfiles, { desc = '[?] Find recently opened files' })
nnoremap('<leader>pf', tel.find_files, { desc = 'Search [F]iles' })
nnoremap('<leader>ph', require 'telescope.builtin'.help_tags, { desc = 'Search [H]elp' })
nnoremap('<leader>pd', require 'telescope.builtin'.diagnostics, { desc = 'Search [D]iagnostics' })
nnoremap('<leader>pg', require 'telescope.builtin'.live_grep, { desc = 'Search by [G]rep' })
nnoremap('<leader>pr', require 'telescope.builtin'.grep_string, { desc = 'Search current [W]ord' })
-- nnoremap('<leader>pg', function()
-- 	tel.grep_string{ search = vim.fn.input("Grep For > ")} end)
-- nnoremap('<leader>pw', function()
-- 	tel.grep_string{ search = vim.fn.expand("<cword>")} end)
nnoremap('<leader>pt', require 'telescope'.extensions.git_worktree.git_worktrees, { desc = 'Search Work[T]rees' })
nnoremap('<leader>pv', mtel.search_dotfiles, { desc = 'Search [V]im Configs' })
nnoremap('<leader>p<space>', mtel.related_files, { desc = '[p ] Search related files' })
nnoremap('<leader>/', mtel.fuzzy_buffer, { desc = '[/] Fuzzily search in current buffer' })
nnoremap('z?', require 'telescope.builtin'.spell_suggest, { desc = 'Suggest Spelling Correction' })

-- Lsp
nnoremap('gd', vim.lsp.buf.definition, { silent = true, desc = 'LSP: [G]oto [D]efinition' })
nnoremap('gD', vim.lsp.buf.declaration, { silent = true })
-- nnoremap('gr', vim.lsp.buf.references, {silent = true, desc = 'LSP: [G]oto [R]eferences'})
nnoremap('gr', require 'telescope.builtin'.lsp_references, { silent = true, desc = 'LSP: [G]oto [R]eferences' })
nnoremap('gi', require 'telescope.builtin'.lsp_implementations, { silent = true, desc = 'LSP: [G]oto [I]mplementations' })
nnoremap('gt', vim.lsp.buf.type_definition, { desc = 'LSP: [G]oto [T]ype Definition' })
nnoremap('g?', vim.diagnostic.open_float, { silent = true })
nnoremap('<leader>cn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' })
nnoremap('<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction' })
nnoremap('[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
nnoremap(']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic ' })
nnoremap('<leader>q', vim.diagnostic.setloclist)
nnoremap('K', vim.lsp.buf.hover, { buffer = 0, desc = 'LSP: Hover Documentation' }) -- Needs colemak rebind
nnoremap('<leader>f', ':Format<CR>', { desc = 'LSP: [F]ormat' })
-- nnoremap(sf('<C-%s>', h), vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation'}) -- Needs colemak rebind
-- nmap('<leader>'..n, function() vim.lsp.diagnostic.goto_next() end, {silent = true})
-- nmap('<leader>'..N, function()
-- 	vim.lsp.diagnostic.show_line_diagnostics()
-- 	vim.lsp.util.show_line_diagnostics()
-- end, {silent = true})

-- Run tests
nnoremap('<leader>tq', ':TestNearest<CR>', { desc = 'Tests: [T]est Nearest [Q]' })
nnoremap('<leader>ta', ':TestFile<CR>', { desc = 'Tests: [T]est [A]ll in File' })
nnoremap('<leader>tz', ':TestSuite<CR>', { desc = 'Tests: [T]est Suite [Z]' })

-- Snippets
local ls = require 'luasnip'
vim.keymap.set({ 'i', 's' }, "<C-k>", function()
	print(ls.expand_or_jumpable())
	-- if ls.expand_or_jumpable() then
	ls.expand_or_jump()
	-- end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, "<C-j>", function()
	-- if ls.jumpable(-1) then
	ls.jump(-1)
	-- end
end, { silent = true })
inoremap("<C-i>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
-- nnoremap('<leader>s', '<cmd>source ~/.config/nvim/lua/manning390/luasnip.lua<cr>')


-- Fugitive
nnoremap('<leader>gs', ':G<cr>')
nnoremap('<leader>gc', ':G ci<cr>')
nnoremap('<leader>gp', ':G push<cr>')
nnoremap('<leader>g' .. j, ':diffget //3<cr>')
nnoremap('<leader>g' .. f, ':diffget //2<cr>')
nnoremap('<leader>gb', ':GBrowse<cr>')
vnoremap('<leader>gb', ":'<,'>GBrowse<cr>")
nnoremap('<leader>gm', ':GBrowse origin/master:%<cr>')
vnoremap('<leader>gm', ":'<,'>GBrowse origin/master:%<cr>")

nnoremap('<leader>gw', require 'telescope'.extensions.git_worktree.create_git_worktree)

-- Quick fix lists
nnoremap('g' .. n, ':cnext<cr>', { silent = true })
nnoremap('g' .. N, ':cprevious<cr>', { silent = true })
nnoremap('gq', fn.toggleQuickfix, { silent = true, desc = "Toggle Quickfix Window" })

-- Jump to EOL
inoremap(';;', '<ESC>A;<ESC>')
inoremap(',,', '<ESC>A,<ESC>')

-- Visual Shifting
vnoremap('<', '<gv')
vnoremap('>', '>gv')

nnoremap('<leader>s', ':setlocal spell!<cr>', { silent = true })
vnoremap('.', ':normal .<cr>')
nnoremap('<leader>%', ':let @+=expand(\'%\')<cr>') -- Yank filepath into copy buffer
nnoremap('Y', 'y$')                                -- Add missing yank
nnoremap('0', function() fn.toggleMovement('^', '0') end)
nnoremap('~', fn.customCaseToggle)

nnoremap('<leader>pm', ':PhpactorContextMenu<cr>')

nnoremap('z/', ':ThesaurusQueryReplaceCurrentWord<cr>')
vnoremap('z/', 'y:ThesaurusQueryReplace <C-r>"<cr>')

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
