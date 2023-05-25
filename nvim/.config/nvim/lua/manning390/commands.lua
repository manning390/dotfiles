vim.api.nvim_create_user_command('W', ':w', {}) -- Fat finger save
vim.api.nvim_create_user_command('Es', ':EslintFixAll', {}) -- Fast alias
vim.api.nvim_create_user_command('Prit', 'silent !npx prettier --write % && :e', {})
vim.api.nvim_create_user_command('Snips', 'e ~/.config/nvim/snippets', {}) -- Reload snippets

-- Leverages tpope/abolish.vim :Subvert to create commands to swap the pairs in the list below
-- ie, :'<,'>WH => var_width -> var_height
-- let Width = mything.box.width()
for from,to in pairs({
    x = 'y', -- XY
    y = 'x', -- YX
    width = 'height', -- WH
    height = 'width' -- HW
}) do
    -- Cmd is the first character of each swap uppercse
    local cmd = string.upper(string.sub(from, 1, 1))..string.upper(string.sub(to, 1, 1))
    vim.api.nvim_create_user_command(cmd, function(opt)
        local reg = vim.fn.getreg('/') -- Save current search buffer
        vim.cmd(opt.line1..','..opt.line2..'Subvert/'..from..'/'..to..'/igew') -- flags, case-insensitive, all occurances in line, no error warnings if not found, whole word match
        vim.cmd('let @/="'..reg..'"') -- Return search buffer to original state
    end, {range = true})
end
