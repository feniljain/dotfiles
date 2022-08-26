nnoremap <Space>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif

" autocmd VimEnter * NERDTree
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeFocus<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
