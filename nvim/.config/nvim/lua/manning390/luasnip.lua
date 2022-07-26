-- if vim.g.snippets ~= "luasnip" then
    -- return
-- end

local ls = require'luasip'
local types = require'luasip.util.types'

ls.config.set_config {
    -- Remember to keep around the last snippet in case you need to jump back to it
    history = true,

    -- Dynamic snippets, updates as type
    updateevents = "TextChanged,TextChangedI",

    -- Autosniipets
    enable_autosnippets = true,

    -- Crazy highlights
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error"} },
            },
        },
    },
}
