local numbertoggle = vim.api.nvim_create_augroup('numbertoggle', { clear = true })
vim.api.nvim_create_autocmd({'BufEnter', 'FocusGained', 'InsertLeave'}, {
    group = numbertoggle,
    command = 'set relativenumber'
})
vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost', 'InsertEnter'}, {
    group = numbertoggle,
    command = 'set norelativenumber'
})

vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {'*.md', '*.mkd', '.txt'},
    group = vim.api.nvim_create_augroup('writing', { clear = true }),
    callback = function()
        vim.call("pencil#init({'wrap':'soft'})")
        vim.call('litecorrect#init()')
        vim.call('lexical#init()')
        vim.cmd('DittoOn')
    end
})
vim.api.nvim_create_autocmd({'BufWritePost'}, {
    group =  vim.api.nvim_create_augroup('packer', {clear = true}),
    pattern = '*packer.lua',
    callback = function()
        require('packer').compile()
        vim.notify('Packer Compile', 'info', {render = 'minimal'})
    end
})
