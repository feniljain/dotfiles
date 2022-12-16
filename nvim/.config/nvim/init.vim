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

 " Force treesitter build on every save
 " augroup updateTreesitterHighlighting
 "     autocmd!
 "     autocmd BufWritePre *.* call UpdateTreesitterHighlightingFn()
 " augroup END

function UpdateTreesitterHighlightingFn()
    " :TSBufDisable highlight
    " :TSBufEnable highlight
endfunction

 " Protobuf support
 augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
 augroup end

 " augroup goFixImportOnSave
 "   autocmd!
 "   autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
 " augroup end

" }}}

" Vimscript file settings ---------------------- {{{
" augroup filetype_vim
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
" augroup END
" }}}

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

" JSON Preview Function ---------------------- {{{
function! JSONPreview()
    yank
    execute ":new"
    execute 'normal! "*p'
    set ft=json
    set noma
    execute ":Prettier"
endfunction
vnoremap <Space>jp :call JSONPreview()<CR>
nnoremap <Space>cb :bd!<CR>
" }}}

" QuickFixToggle ---------------------- {{{
function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
endfunction
nnoremap <silent> <C-q> :call QuickFixToggle()<CR>
" }}}

" terminal split helper function ---------------------- {{{
function! TerminalSplitHelper()
    split tempTerminal
    <Space>j
    resize -15
endfunction
" nnoremap <Space>tt :call TerminalSplitHelper()<CR>
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

" Remove file name inclusion in search in rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nmap <silent> gof :exec '!gofmt -w '.expand('%:p')<CR>
" nmap <silent> gol :exec '!golint .'<CR>
nmap <silent> gol :exec '!golint '.expand('%:p')<CR>

nnoremap <Space>m :MaximizerToggle<CR>
" nmap <silent> rof :exec '!rustfmt -w '.expand('%:p')<CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

autocmd InsertLeave * set nopaste

" Highlighting for languages inside code blocks of markdown ( it's an inbuilt feature )
" Ref: https://www.getrevue.co/profile/vim_tricks/issues/highlight-syntax-inside-markdown-1253642
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']
