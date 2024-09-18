"  |  ____|       (_) |      | |     (_)
"  | |__ ___ _ __  _| |      | | __ _ _ _ __
"  |  __/ _ \ '_ \| | |  _   | |/ _` | | '_ \
"  | | |  __/ | | | | | | |__| | (_| | | | | |
"  |_|  \___|_| |_|_|_|  \____/ \__,_|_|_| |_|
"
"  Author: fkjainco@gmail.com
"  File: init.vim (Neovim configuration)

"echo ">^.^<" echo "Hello, fenil!"

" :source $MYVIMRC

" Autocommands ---------------------- {{{
" Removes all previous autocmd to prevent stacking of same command over save
 " augroup autocmdSafety
 " 	autocmd!
 "    "autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
 " augroup END

 " Remove trailing white spaces
 augroup removeTrailingSpace
     autocmd!
     autocmd BufWritePre *.* :%s/\s\+$//e
 augroup END

" BG transparent settings in neovim ---------------------- {{{
let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#111111 ctermbg=black
    " hi Normal guibg=#111111 ctermbg=black ctermfg=Cyan
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
"nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>
nnoremap <space>tb :call Toggle_transparent_background()<CR>
" }}}

" Help Open Function(Helps in lua dev) ---------------------- {{{
function! OpenHelp()
    let wordUnderCursor = expand("<cword>")
    echo wordUnderCursor
    :exec ':help '.expand("<cword>")
    " help <cword>
endfunction
nnoremap <Tab>h :call OpenHelp()<CR>
" }}}

" Longer highlighting mapping ---------------------- {{{
" define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=darkgray

" highlight the current line
nnoremap <Space>sl :call matchadd('LineHighlight', '\%'.line('.').'l')

" clear all the highlighted lines
nnoremap <Space>cs :call clearmatches()
" }}}

" Non Plugin Let Commands ---------------------- {{{
" Fixing clipboard warning
let g:loaded_clipboard_provider = 1

" Syntax highlighting for lua in vim files
let g:vimsyn_embed = 'l'
" }}}

" Change font size quickly ---------------------- {{{
" Use ctrl Shift + -> Increase font size
" Use ctrl - -> Decrease font size
" }}}

" Highlighting for languages inside code blocks of markdown ( it's an inbuilt feature )
" Ref: https://www.getrevue.co/profile/vim_tricks/issues/highlight-syntax-inside-markdown-1253642
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']

