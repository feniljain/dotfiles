" CoC Extension Installed and coc-config ---------------------- {{{
" COC Extensions Installed
" coc-clangd
" coc-css
" coc-eslint
" coc-flutter
" coc-go
" coc-highlight
" coc-html
" coc-json
" coc-lists
" coc-lua
" coc-marketplace
" coc-pairs
" coc-prettier
" coc-protobuf
" coc-python
" coc-rust-analyzer
" coc-snippets
" coc-syntax
" coc-tsserver
" coc-ultisnips
" coc-xml
" coc-yank
" coc-spell-checker
" coc-discord-rpc

"  \'coc-lua',
"let g:coc_global_extensions=[
"      \'coc-clangd',
"      \'coc-css',
"      \'coc-eslint',
"      \'coc-flutter',
"      \'coc-go',
"      \'coc-highlight',
"      \'coc-html',
"      \'coc-json',
"      \'coc-lists',
"      \'coc-marketplace',
"      \'coc-pairs',
"      \'coc-prettier',
"      \'coc-protobuf',
"      \'coc-python',
"      \'coc-rust-analyzer',
"      \'coc-snippets',
"      \'coc-syntax',
"      \'coc-tsserver',
"      \'coc-ultisnips',
"      \'coc-xml',
"      \'coc-yank',
"      \'coc-spell-checker',
"      \'coc-discord-rpc'
"      \]
"      " \'coc-lua',
"
"" CoC config ---------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" COC CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"			\ pumvisible() ? "\<C-n>" :
"			\ <SID>check_back_space() ? "\<TAB>" :
"			\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" coc-prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> grn <Plug>(coc-rename)
"" nmap <silent> gdn tabedit % | call CocActionAsync('jumpDefinition')<cr>
"
"" nmap <space>cla <Plug>(coc-codeaction-selected)
"nmap <space>cla <Plug>(coc-codeaction)
"nmap <space>cls :CocList symbols<cr>
"nmap <space>cld :CocList diagnostics<cr>
"nmap <space>clc :CocList commands<cr>
"" nmap <space>le :CocCommand explorer<cr>
"nmap <space>cfc <Plug>(coc-fix-current)
"nmap <space>cfm <Plug>(coc-format)
"nmap <space>crf <Plug>(coc-refactor)
"nmap <space>cdi <Plug>(coc-diagnostic-info)
"nmap <space>cdn <Plug>(coc-diagnostic-next)
"nmap <space>cdp <Plug>(coc-diagnostic-prev)
"nmap <space>cfh <Plug>(coc-float-hide)
"nmap <space>cen <Plug>(coc-diagnostic-next-error)
"nmap <space>cep <Plug>(coc-diagnostic-prev-error)
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif
"
"
"" Remap <C-f> and <C-b> for scroll float windows/popups.
"nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
"inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" END OF COC CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" }}}
"
"nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"'
 "Lua.workspace.library": {
    "/usr/share/nvim/runtime/lua": true,
    "/usr/share/nvim/runtime/lua/vim": true,
    "/usr/share/nvim/runtime/lua/vim/lsp": true
  " },
  "Lua.diagnostics.globals": ["vim"],
"lua.trace.server": "off"
