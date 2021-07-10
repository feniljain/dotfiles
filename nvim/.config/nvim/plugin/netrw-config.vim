" netrw config
let g:netrw_banner = 0 " use I to toggle
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " use gh to toogle
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir = "rm -r"

" lua require("fenil")
"
" function ApplyNetrwMaps()
"     nnoremap <buffer> ts :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
"     nnoremap <buffer> tg :lua require('telescope.builtin').git_files()<CR>
"     nnoremap <buffer> tf :lua require('telescope.builtin').find_files()<CR>
"
"     nnoremap <buffer> tcs :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
"     nnoremap <buffer> tt :lua require('telescope.builtin').buffers()<CR>
"     nnoremap <buffer> tb :lua require('telescope.builtin').builtin()<CR>
"     nnoremap <buffer> th :lua require('telescope.builtin').help_tags()<CR>
"     nnoremap <buffer> td :lua require('fenil.telescope').search_dotfiles()<CR>
"     nnoremap <buffer> tgb :lua require('fenil.telescope').git_branches()<CR>
" endfunction
"
" augroup netrw_maps
"   autocmd!
"   autocmd filetype netrw call ApplyNetrwMaps()
" augroup END
