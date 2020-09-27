let g:lightline#bufferline#show_number=2 " numbers are ordinal
"let g:lightline#bufferline#modified='*' " shows file has been modified
let g:lightline#bufferline#unnamed='[No Name]' " unsaved files are no name
"let g:lightline#bufferline#number_seperator='|' " seperator between buffer and name
let g:lightline = {}
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {
	\'buffers': 'lightline#bufferline#buffers',
    \'linter_checking': 'lightline#ale#checking',
    \'linter_warnings': 'lightline#ale#warnings',
    \'linter_errors': 'lightline#ale#errors',
    \'linter_ok': 'lightline#ale#ok',
	\}
let g:lightline.component_type   = {
	\'buffers': 'tabsel',
    \'linter_checking': 'left',
    \'linter_warnings': 'warning',
    \'linter_errors': 'error',
    \'linter_ok': 'left',
	\}
let g:lightline.active = {
	\'left': [['mode','paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
	\'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
	\}
let g:lightline.component_function = { 'gitbranch': 'fugitive#head' }
