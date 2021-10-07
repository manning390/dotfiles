lua << EOF
require('bufferline').setup {options ={
    numbers = function(opts)
    return string.format('%s.', opts.ordinal)
    end,
    diagnostics = "nvim_lsp",
    show_close_icon = false,
    show_buffer_close_icons = false,
}}
EOF
