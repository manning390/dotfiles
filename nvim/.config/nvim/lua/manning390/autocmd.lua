local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

local numbertoggle = ag('numbertoggle', { clear = true })
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
--     group = ag('writing', {clear = true}),
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
-- au({'BufReadPost', 'FileReadPost', 'BufEnter'}, {
--     group = ag('openfolds', {clear = true}),
--     command = 'normal zR'
-- })
au('TextYankPost', {
    group = ag('yank_highlight', { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
    end,
})
-- Show line diagnostics automatically in hover window
au({ 'CursorHold', 'CursorHoldI' }, {
    pattern = { '*' },
    group = ag('diagnostic', { clear = true }),
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

au({ 'Filetype' }, {
    pattern = 'gitcommit',
    group = ag('gitcommitSpell', { clear = true }),
    command = 'setlocal spell textwidth=72',
})

au({ 'Filetype' }, {
    pattern = 'Makefile',
    group = ag('MakefileTab', { clear = true }),
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
    end
})
