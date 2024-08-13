" Set Commands ---------------------- {{{
set guicursor= " Reset the gui cursor options, for more details just press K on it.
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
" set clipboard=unnamed       " Use system clipboard
set backspace=indent,eol,start
set number
" set modifiable " allows modifying buffers like quickfixlist " after edit save the buffer using: :cgetbuffer
set relativenumber
set ts=2 sw=2
set linebreak
set laststatus=3
set cmdheight=0
" set bg=light
set background=dark
set t_Co=256
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
set hidden
set history=1000 " Increase the undo limit
set tabstop=4 softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
set smartindent " superset of autoindent
set termguicolors
set colorcolumn=80
set autoread
set encoding=utf-8
set syntax
set noshowmode
set autowrite
set emoji
set lazyredraw
" set nowrap
set wrap
set display+=lastline
syntax on
" Make search easier
set hlsearch
set incsearch
set smartcase
" set ignorecase

set wildmenu
set title

set confirm" Display a confirmation dialog when closing an unsaved file.

set backupdir=~/.cache/vim " Directory to store backup files.

" Visual indication of line your cursor is on, works in normal and visual mode
set cursorline
set signcolumn=yes:1 " Do not mess with this, unless you want your editor window dancing
set mouse=
"set updatetime=300
set wildmode=longest,list,full

" https://github.com/neovim/neovim/pull/14537
" https://www.reddit.com/r/neovim/comments/ym6x7y/enable_new_diff_option_linematch_14537/
set diffopt+=vertical
set diffopt+=linematch:60

set shortmess+=c

" For tree sitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set scrolloff=4

" set spilts to be done below and right rather than defaults
set splitbelow
set splitright

set inccommand=split

set switchbuf=useopen,usetab
" set winbar=%f " Uncomment this once it is fully realeased

" https://github.com/neovim/neovim/pull/20750
set foldtext=
" set fillchars=fold:\ " ugly

set updatetime=250

" enable list mode
" set list
" displaying tabs become annyoing in Go codebases
" display indicators for different chars
" set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

" Nvim 0.8.0 features
" " Using tree sitter based spell checker, this only checks comments in code
" set spell " ughh...this is annoying
" }}}

syntax enable
filetype plugin indent on
