let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

call deoplete#custom#source('_', 'converters', ['converters_auto_paren'])
call deoplete#custom#option({
\'smart_case': v:true,
\'auto_complete': v:true,
\'auto_complete_start_length': 1
\})
