"echo ">^.^<"
"echo "Hello, fenil!"

" Coc-Config ---------------------------------- {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent><nowait>gpgd :call CocAction('jumpDefinition', v:false)<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gty <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gnr <Plug>(coc-rename)
" nmap <silent> gdn tabedit % | call CocActionAsync('jumpDefinition')<cr>
" nmap <space>cla <Plug>(coc-codeaction-selected)
nmap <silent> gca <Plug>(coc-codeaction-cursor)
vmap <silent> gca <Plug>(coc-codeaction-selected)
" nmap <space>so :CocList symbols<cr>
nmap <space>so :Vista coc<cr>
nmap <silent> gfd :CocFzfList diagnostics<cr>
nmap <silent> glc :CocFzfList commands<cr>
" nmap <space>le :CocCommand explorer<cr>
nmap <silent> gfc <Plug>(coc-fix-current)
nmap <space>f <Plug>(coc-format)
nmap <silent> gfr <Plug>(coc-refactor)
" nmap <space>gdi <Plug>(coc-diagnostic-info)
nmap <silent>gnd <Plug>(coc-diagnostic-next)
nmap <silent>gpd <Plug>(coc-diagnostic-prev)
nmap <space>gfh <Plug>(coc-float-hide)
nmap gsd :CocFzfList diagnostics<CR>
nmap <space>cen <Plug>(coc-diagnostic-next-error)
nmap <space>cep <Plug>(coc-diagnostic-prev-error)
nmap <space>rl :CocFzfListResume<CR>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
"
"
"" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
"inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" END OF COC CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" terminal mappings
tnoremap jk <C-\><C-n>
noremap <C-t> :terminal<CR>

inoremap jk <esc>
" To force myself to learn to use new esc key: 'jk', and also not use any
" arrow keys
inoremap <esc> <nop>
inoremap <OA> <nop>
inoremap <OB> <nop>
inoremap <OD> <nop>
inoremap <OC> <nop>
""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap  <C-l> :tabn<CR>
noremap  <C-h> :tabp<CR>
noremap  <C-n> :tabnew<CR>
noremap  <Space>df :DartFmt<CR>
" noremap  tf :Files<CR>
" noremap  ts :Rg<CR>
" noremap  tt :Buffers<CR>
nnoremap <Space>nf :NERDTreeFind<CR>
nnoremap <Space>nt :NERDTreeToggle<CR>
nnoremap <Space>gi :GoImports<CR>
nnoremap <Space>rh :nohlsearch<CR>
nnoremap <Space>cb :bd!<CR>
" Winteract Settings
nmap <Space>rw :InteractiveWindow<CR>
nnoremap <Space>rf :RustFmt<CR>
nnoremap <Space>rr :CocCommand rust-analyzer.reload<CR>


" Press Ctrl-u in insert mode to convert current word under cursor to uppercase
" inoremap <C-u> jkviwU
" Press Ctrl-u in normal mode to convert current word under cursor to uppercase
" nnoremap <C-u> viwU
" To open vimrc in a new vertical split
nnoremap <Space>ev :vsplit $MYVIMRC<cr>
" To source vimrc quickly
nnoremap <Space>sv :source $MYVIMRC<cr>

" Vim-Fugitive
noremap <Space>gm :Gdiffsplit!<CR>
noremap <Space>gl :diffget //2<CR>
noremap <Space>gr :diffget //3<CR>
noremap <Space>gw :Gwrite!<CR>

" Git blame
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0

" Pane navigation
noremap <Space>h <C-W>h
noremap <Space>j <C-W>j
noremap <Space>k <C-W>k
noremap <Space>l <C-W>l

" Navigate quickfix list with ease for ack.vim
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprevious<CR>
" nnoremap <silent> <C-q> :cw<CR> " Replaced by function QuickFixToggle()

" Window split shortcuts
nnoremap <Space>v :vsplit<CR>
nnoremap <Space>- :split<CR>

nnoremap <Space><Space> :Commentary<cr>
vnoremap <Space><Space> :Commentary<cr>

" let g:coc_global_extensions=[
"     \'coc-clangd',
" 		\'coc-css',
" 		\'coc-eslint',
" 		\'coc-flutter',
" 		\'coc-go',
" 		\'coc-highlight',
" 		\'coc-html',
" 		\'coc-json',
" 		\'coc-lists',
" 		\'coc-marketplace',
" 		\'coc-pairs',
" 		\'coc-prettier',
" 		\'coc-protobuf',
" 		\'coc-python',
" 		\'coc-rust-analyzer',
" 		\'coc-snippets',
" 		\'coc-syntax',
" 		\'coc-tsserver',
" 		\'coc-ultisnips',
" 		\'coc-xml',
" 		\'coc-yank',
" 		\'coc-spell-checker',
" 		\'coc-discord-rpc'
" 		\'coc-actions'
" 	\]


call plug#begin('~/.local/share/nvim/plugged')
Plug 'szw/vim-maximizer'
Plug 'preservim/NERDTree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'ggreer/the_silver_searcher'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ThePrimeagen/harpoon'
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'hzchirs/vim-material'
Plug 'Yggdroot/indentLine'
"Plug 'wellle/tmux-complete.vim'
" Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'farmergreg/vim-lastplace'
Plug 'romgrk/winteract.vim'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
" Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'

" Testing
Plug 'vim-test/vim-test'

Plug 'liuchengxu/vista.vim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'p00f/nvim-ts-rainbow'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'folke/lsp-colors.nvim' " Do not remove this it provides compatibility for highlighting, or it starts break badly
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ellisonleao/glow.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kwkarlwang/bufresize.nvim'
Plug 'puremourning/vimspector'
call plug#end()

" set clipboard=unnamedplus " Use system clipboard
set guicursor= " Reset the gui cursor
set backspace=indent,eol,start
set number
set relativenumber
set incsearch
set ts=2 sw=2
set laststatus=2
set cmdheight=1
set bg=dark
set background=dark
set t_Co=256
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
set hidden
set diffopt+=vertical
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set termguicolors " Do not set this option with vim or your highlighting will stop working
set colorcolumn=80
set autoread
set encoding=utf-8
set noshowmode
set autowrite
set emoji
set wrap
set syntax=on
" Makes search easier
set smartcase
set ignorecase
set scrolloff=0
set wildmode=longest,list,full
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set so=4
" set spilts to be done below and right rather than defaults
set splitbelow
set splitright

set switchbuf=useopen,usetab
let g:fzf_buffers_jump=1

" Removes all previous autocmd to prevent stacking of same command over save
" augroup autocmdSafety
" 	autocmd!
" 	autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
" augroup END

"Vim-go config
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

set backspace=indent,eol,start
let g:rainbow_active = 1
let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_map = v:true
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:dart_style_guide = 2
let g:ackprg = 'ag --vimgrep'
"let g:dart_format_on_save = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_cargo_use_clippy = 1
let g:rust_clip_command = 'xclip -selection clipboard'

let g:suda_smart_edit = 1
let g:suda#prompt = 'Password > '

let test#strategy = 'basic'
nnoremap <Space>tn :TestNearest<CR>
nnoremap <Space>tf :TestFile<CR>
nnoremap <Space>tl :TestLast<CR>

let g:lightline = {
			\ 'colorscheme': 'seoul256',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ]]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'gitbranch#name',
			\   'cocstatus': 'coc#status'
			\ },
			\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Remove trailing white spaces
augroup removeTrailingSpace
    autocmd!
    autocmd BufWritePre *.* :%s/\s\+$//e
augroup END

" Protobuf support
" augroup filetype
"   au! BufRead,BufNewFile *.proto setfiletype proto
" augroup end

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

nmap <silent> gof :exec '!gofmt -w '.expand('%:p')<CR>
nmap <silent> gol :exec '!golint '.expand('%:p')<CR>

nnoremap <Space>m :MaximizerToggle<CR>

" GruvBox Config
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_improved_warnings = '1'
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
syntax on

command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

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

" Use Y to automatically select to the end of the line
nnoremap Y y$

" Center screen while jumping in search
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving lines around in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better indenting
vnoremap > >gv
vnoremap < <gv

" Print pwd
nnoremap <Space>cd :!pwd<CR>

" To make background transparent
" Always remember to keep this after colorscheme
hi Normal guibg=NONE ctermbg=NONE

autocmd InsertLeave * set nopaste

" Highlighting for languages inside code blocks of markdown ( it's an inbuilt feature )
" Ref: https://www.getrevue.co/profile/vim_tricks/issues/highlight-syntax-inside-markdown-1253642
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']
