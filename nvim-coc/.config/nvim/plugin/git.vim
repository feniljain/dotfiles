" Vim-Fugitive
"
noremap <Space>gm :Gdiffsplit!<CR>
noremap <Space>gl :diffget //2<CR>
noremap <Space>gr :diffget //3<CR>
noremap <Space>gw :Gwrite!<CR>

" Git blame
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0

" [c & ]c -> previous and next conflict
