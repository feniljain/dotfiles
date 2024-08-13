" general LSP settings
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" vim-test config
let test#strategy = 'basic'

" NerdTree config
let NERDTreeShowHidden=1

" netrw config
let g:netrw_banner = 0 " use I to toggle
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " use gh to toogle
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir = "rm -r"

" Suda config
let g:suda_smart_edit = 1
let g:suda#prompt = 'Password > '

" Vimspector config
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go', 'CodeLLDB' ]

fun! GotoWindow(id)
    call win_gotoid(a:id)
    <C-W>m
endfun

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
