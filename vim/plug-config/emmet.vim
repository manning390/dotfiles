let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_expandabbr_key='<Tab>'
imap <silent><expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
