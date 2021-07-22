let g:ale_linters = {
\'clojure': [,'clj-kondo', 'joker']
\}
let g:ale_fixers = {
\'markdown': ['remark-lint'],
\'javascript': ['eslint'],
\'css': ['prettier'],
\}
let g:ale_lint_on_enter=0
let g:ale_fix_on_save=1
let g:ale_lint_on_text_changed = 'never'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5

" highlight! ALEErrorSign ctermfg=0 ctermbg=8 guifg=#A5A5A5 guibg=#F5F5F5
" highlight! ALEWarningSign ctermfg=0 ctermbg=0 guifg=#A5A5A5 guibg=#F5F5F5
