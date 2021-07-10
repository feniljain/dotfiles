"echo ">^.^<"
"echo "Hello, fenil!"

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
noremap  <Space>ff :Files<CR>
noremap  <Space>fs :Ag<CR>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <Space>gi :GoImports<CR>
" Press Ctrl-u in insert mode to convert current word under cursor to uppercase
inoremap <C-u> jkviwU
" Press Ctrl-u in normal mode to convert current word under cursor to uppercase
nnoremap <C-u> viwU
" To open vimrc in a new vertical split
nnoremap <Space>ev :vsplit $MYVIMRC<cr>
" To source vimrc quickly
nnoremap <Space>sv :source $MYVIMRC<cr>

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'ggreer/the_silver_searcher'
Plug 'airblade/vim-gitgutter'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'hail2u/vim-css3-syntax'
Plug 'hzchirs/vim-material'
Plug 'preservim/NERDTree'
Plug 'Yggdroot/indentLine'
"Plug 'wellle/tmux-complete.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'farmergreg/vim-lastplace'
"Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
call plug#end()

set clipboard=unnamedplus " Use system clipboard
set number
set relativenumber
set incsearch
set ts=2 sw=2
set laststatus=2
set cmdheight=2
set bg=dark
set background=dark
set t_Co=256
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
"set updatetime=300

" Removes all previous autocmd to prevent stacking of same command over save
augroup autocmdSafety
	autocmd!
	autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
augroup END
"Vim-go config
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" GruvBox Config
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_improved_warnings = '1'
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
" To make background transparent
hi Normal guibg=NONE ctermbg=NONE

set backspace=indent,eol,start
let g:rainbow_active = 1
let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_map = v:true
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:dart_style_guide = 2
let g:ackprg = 'ag --vimgrep'
"let g:dart_format_on_save = 1
"let g:lightline = {
"      \ 'colorscheme': 'powerline',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ], 
"      \             [ 'readonly', 'filename', 'modified', 'fugitive'] ]
"      \ },
"      \ 'component': {
"       \   'fugitive': LightlineFugitive(),
"      \ },
"      \ }

" VIM Material configs

" Oceanic
"let g:material_style='oceanic'
"set background=dark
"colorscheme vim-material

"	"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"	"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"	"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"	if (empty($TMUX))
"		if (has("nvim"))
"			"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"			let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"		endif
"		"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"		"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"		" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"		if (has("termguicolors"))
"			set termguicolors
"		endif
"	endif

" syntax on
" colorscheme onedark
