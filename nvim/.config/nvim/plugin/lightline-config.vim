" Lightline Config ---------------------- {{{
" For use with josa42/vim-lightline-coc
"let g:lightline = {
"      \   'active': {
"      \     'left': [[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ], [  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]]
"      \   },
"      \ 'component_function': {
"      \   'gitbranch': 'gitbranch#name'
"      \ },
"      \ 'colorscheme': 'seoul256',
"      \ }

" let tresitter_opts = {
"     \ "indicator_size" : 100,
"     \ "type_patterns" : {'class', 'function', 'method'},
"     \ "transform_fn" : function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
"     \ "separator" : ' -> ',
" };

let g:lightline = {
\ 'colorscheme': 'seoul256',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ]]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name',
\   'cocstatus': 'coc#status'
\ },
\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" register compoments:
" call lightline#coc#register()
" }}}
