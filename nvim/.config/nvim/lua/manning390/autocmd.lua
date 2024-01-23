local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

au({ 'BufWritePre' }, {
    group = ag('LspFormatting', {}),
    command = 'Format'
})

local numbertoggle = ag('numbertoggle', {})
au({ 'BufEnter', 'FocusGained', 'InsertLeave' }, {
    group = numbertoggle,
    command = 'set relativenumber'
})
au({ 'BufLeave', 'FocusLost', 'InsertEnter' }, {
    group = numbertoggle,
    command = 'set norelativenumber'
})

-- au({'FileType'}, {
--     pattern = {'*.md', '*.mkd', '*.txt'},
--     group = ag('writing',{}),
--     callback = function()
--         vim.call("pencil#init({'wrap':'soft'})")
--         vim.call('litecorrect#init()')
--         vim.call('lexical#init()')
--         vim.cmd('DittoOn')
--     end
-- })
au({ 'BufEnter', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
    group = ag('treesitter_fold_workaround', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end
})
-- au({'BufReadPost', 'FileReadPost'}, {
--     group = ag('openfolds',{}),
--     command = 'normal zR'
-- })
au('TextYankPost', {
    group = ag('yank_highlight', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
    end,
})
-- Show line diagnostics automatically in hover window
au({ 'CursorHold', 'CursorHoldI' }, {
    pattern = { '*' },
    group = ag('diagnostic', {}),
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

au({ 'Filetype' }, {
    pattern = 'gitcommit',
    group = ag('gitcommitSpell', {}),
    command = 'setlocal spell textwidth=72',
})

au({ 'Filetype' }, {
    pattern = 'Makefile',
    group = ag('MakefileTab', {}),
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
    end
})
-- local tailwindwraptoggle = ag('tailwindwraptoggle', {})
-- au({ 'BufEnter', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--     pattern = 'svelte',
--     group = tailwindwraptoggle,
--     callback = function ()
--         print('yep')
--         vim.o.wrap = true
--     end
-- })
-- au({ 'BufLeave', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--     pattern = '*',
--     group = tailwindwraptoggle,
--     callback = function ()
--         print('yep')
--         vim.o.wrap = true
--     end
-- })
