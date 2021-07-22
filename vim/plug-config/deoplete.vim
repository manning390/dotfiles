let g:deoplete#enable_at_startup = 1
" augroup deoplete
    " autocmd!
    " autocmd InsertEnter * call deoplete#enable() " run after entering and not when launching
" augroup END
" When autocomplete triggers, automatically selects first option
set completeopt+=noinsert
call deoplete#custom#option({
\   'smart_case': v:true,
\   'auto_complete': v:false,
\   'keyword_patterns': {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'}
\})

