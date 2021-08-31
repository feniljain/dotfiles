" FZF Mappings
" noremap <Space>fs :Rg<CR>
" noremap <Space>ff :Files<CR>
" noremap <Space>fb :Buffers<CR>
" noremap <Space>fc :Colors<CR>
"noremap `` :Buffers<CR>
"noremap `s :Rg<CR>
"noremap `f :Files<CR>
"noremap `c :Commits<CR>

"fzf config
" let g:fzf_layout = { 'down': '~30%' }

" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
