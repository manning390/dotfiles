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
            "vendor"
        },

        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-g>"] = actions.send_to_qflist,
            },
        },

    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

pcall(require("telescope").load_extension, "fzy")
pcall(require("telescope").load_extension, "git_worktree")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        prompt_title = "< DOTFILES >",
        cwd = vim.env.DOTFILES,
    })
end
M.project_files = function()
    local opts = {}
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end
M.related_files = function()
    print("WIP")
    -- local cwd = vim.fn.getcwd()
    -- local p = vim.fn.expand('%')
    -- local j, k = string.find(p, cwd)
    -- print(cwd, p, j, k)
    -- local i, _ = string.find(p, '.', 1, true)
    -- local sans = string.sub(p, 1, i-1)
    -- require'telescope.builtin'.find_files({
    --     find_command = {'rg', sans, '--files', '--hidden', '-g', '!.git'},
    --     prompt_title = "< RELATED >",
    -- })
end
M.fuzzy_buffer = function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

return M
