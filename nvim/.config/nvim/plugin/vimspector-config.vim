let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go', 'CodeLLDB' ]

fun! GotoWindow(id)
    call win_gotoid(a:id)
    <C-W>m
endfun

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
