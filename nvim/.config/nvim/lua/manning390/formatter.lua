require("formatter").setup {
    filetype = {
        lua = {
            require("formatter.filetypes.lua").luafmt
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier
        },
        ['*'] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
