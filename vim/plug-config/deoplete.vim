let g:deoplete#enable_at_startup = 0
augroup deoplete
    autocmd!
    autocmd InsertEnter * call deoplete#enable() " run after entering and not when launching
augroup END
call deoplete#custom#option({
\'sources': {'_': ['ale']},
\'smart_case': v:true,
\'auto_complete': v:true
\})
