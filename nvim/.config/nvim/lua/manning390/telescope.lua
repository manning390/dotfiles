if not pcall(require, 'telescope') then
    print("Telescope not installed")
    return
end

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        file_ignore_patterns = {
            "node_modules",
            "^vendor/",
        },
        -- vimgrep_arguments = {
        --     'rg',
        --     '--no-ignore-vcs',
        --     '--color=never',
        --     '--no-heading',
        --     '--with-filename',
        --     '--line-number',
        --     '--column',
        --     '--smart-case',
        --     '--hidden',
        -- },

        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
        mappings = {
            i = {
                ['<C-v>'] = actions.select_vertical,
                ["<C-a>"] = actions.send_to_qflist,
                ["<C-g>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_selected_to_qflist,
            },
        },

    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        tailiscope = {
            default = "all"
        },
    },
})

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("tailiscope")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("heading")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        prompt_title = "< DOTFILES >",
        cwd = vim.env.DOTFILES,
    })
end
M.project_files = function()
    local opts = { show_untracked = true }
    require 'telescope.builtin'.find_files(opts)
end
M.related_files = function()
    local removeAfterLastSlash = function(s)
        return string.sub(s, 1, string.find(s, '/[^/]*$') - 1)
    end

    local path = removeAfterLastSlash(vim.fn.expand('%'))
    local opath = ''

    -- Set opposite path to the opposite side of the project
    if string.find(path, 'test') then
        opath = string.gsub(path, 'test', 'main')
    else
        opath = string.gsub(path, 'main', 'test')
    end

    -- Make the opposite path the longer of the two paths
    if #path > #opath then
        local tmp = path
        path = opath
        opath = tmp
    end

    -- Get to the closest existing directory
    while opath ~= '' and vim.fn.isdirectory(opath) ~= 1 do
        opath = removeAfterLastSlash(string.sub(opath, 1, -2))
    end

    -- Open telescope
    require 'telescope.builtin'.find_files({
        find_command = { 'rg', path, opath, '--files' },
        prompt_title = "< RELATED >",
    })
end
M.fuzzy_buffer = function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
        .get_dropdown {
            winblend = 10,
            previewer = false,
        })
end

return M
