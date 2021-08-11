lua << EOF
require('bufferline').setup {options ={
    numbers = "ordinal",
    number_style = "none",
    mappings = false,
    diagnostics = "nvim_lsp",
    show_close_icon = false,
    show_buffer_close_icons = false,
}}
EOF
