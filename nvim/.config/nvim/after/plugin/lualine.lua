local harpoon = {
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

local filename = {
    'filename',
    path = 1
}
local space = function()
    local space = vim.fn.search([[\s\+$]], 'nwc')
    return space ~= 0 and "TW:" .. space or ""
end

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
    return function(str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then
            return ''
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
        end
        return str
    end
end

local branch = {
    'branch',
    fmt = function(str)
        local win_width = vim.fn.winwidth(0)
        local head, tail = str:find("^feature/")
        if win_width <= 80 then
            return ''
        elseif head ~= nil then
            return "[nw-" .. str:match("%d+", tail + 1) .. "]"
        end
        return str
    end
}
require('lualine').setup {
    options = {
        theme = 'nord',
        globalstatus = true,
    },
    sections = {
        lualine_b = { branch },
        lualine_c = { filename, harpoon, space }
    },
    -- tabline = {
    --     lualine_a = {},
    --     lualine_c = { harpoon, filename },
    --     lualine_z = { 'tabs' }
    -- },
    extensions = {
        'fugitive',
        'man',
        'quickfix'
    }
}
