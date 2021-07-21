let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go', 'CodeLLDB' ]

fun! GotoWindow(id)
    call win_gotoid(a:id)
    <C-W>m
endfun

" Debugger remaps
" nnoremap <Space>m <C-W>m
nnoremap <Space>dd :call vimspector#Launch()<CR>
nnoremap <Space>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <Space>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <Space>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <Space>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <Space>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <Space>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <Space>de :call vimspector#Reset()<CR>

nnoremap <Space>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <Space>dl <Plug>VimspectorStepInto
nmap <Space>dj <Plug>VimspectorStepOver
nmap <Space>dk <Plug>VimspectorStepOut
nmap <Space>d_ <Plug>VimspectorRestart
nnoremap <Space>d<space> :call vimspector#Continue()<CR>

nmap <Space>drc <Plug>VimspectorRunToCursor
nmap <Space>dbp <Plug>VimspectorToggleBreakpoint
nmap <Space>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" for normal mode - the word under the cursor
nmap <Space>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Space>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
