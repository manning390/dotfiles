local  harpoon = {
    function()
        local harpoon_number = require('harpoon.mark').get_index_of(vim.fn.bufname())
        if harpoon_number then
            return "ﯠ " .. harpoon_number
        else
            return "ﯡ "
        end
    end,
    color = function()
        if require('harpoon.mark').get_index_of(vim.fn.bufname()) then
            return { fg = "#98be65", gui = 'bold' }
        else
            return { fg = "#ec5f67" }
        end
    end
}
require('lualine').setup{
    options = {
        theme = 'nord',
    },
    sections = {
        lualine_c = {'filename', harpoon}
    },
}
