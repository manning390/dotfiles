local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

local numbertoggle = ag('numbertoggle', { clear = true })
au({'BufEnter', 'FocusGained', 'InsertLeave'}, {
    group = numbertoggle,
    command = 'set relativenumber'
})
au({'BufLeave', 'FocusLost', 'InsertEnter'}, {
    group = numbertoggle,
    command = 'set norelativenumber'
})

au({'FileType'}, {
    pattern = {'*.md', '*.mkd', '*.txt'},
    group = ag('writing', {clear = true}),
    callback = function()
        vim.call("pencil#init({'wrap':'soft'})")
        vim.call('litecorrect#init()')
        vim.call('lexical#init()')
        vim.cmd('DittoOn')
    end
})
au({'BufWritePost'}, {
    group =  ag('packer', {clear = true}),
    pattern = '*packer.lua',
    callback = function()
        require('packer').compile()
        vim.notify('Packer Compile', 'info', {render = 'minimal'})
    end
})
au({'BufEnter', 'BufNew', 'BufNewFile', 'BufWinEnter'}, {
    group = ag('treesitter_fold_workaround', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end
})
au({'BufReadPost', 'FileReadPost', 'BufEnter'}, {
    group = ag('openfolds', {clear = true}),
    command = 'normal zR'
})
au('TextYankPost', {
  group = ag('yank_highlight', {clear = true}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  end,
})
