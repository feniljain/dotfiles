augroup netrw_maps
  autocmd!
  " autocmd filetype netrw call s:ApplyNetrwMaps()
augroup END

function! s:ApplyNetrwMaps()
    " lua require("fenil")

    nmap <buffer> ts :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
    nmap <buffer> tg :lua require('telescope.builtin').git_files()<CR>
    nmap <buffer> tf :lua require('telescope.builtin').find_files()<CR>

    nmap <buffer> tcs :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
    nmap <buffer> tt :lua require('telescope.builtin').buffers()<CR>
    nmap <buffer> tb :lua require('telescope.builtin').builtin()<CR>
    nmap <buffer> th :lua require('telescope.builtin').help_tags()<CR>
    nmap <buffer> td :lua require('fenil.telescope').search_dotfiles()<CR>
    nmap <buffer> tgb :lua require('fenil.telescope').git_branches()<CR>
endfunction
