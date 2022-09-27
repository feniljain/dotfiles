" To jump to the buffer window if it is already open
let g:fzf_buffers_jump=1

"fzf config
" let g:fzf_layout = { 'down': '~30%' }

" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

