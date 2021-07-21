" Set Commands ---------------------- {{{
set guicursor= " Reset the gui cursor options, for more details just press K on it.
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set clipboard=unnamed       " Use system clipboard
set backspace=indent,eol,start
set number
set relativenumber
set incsearch
set ts=2 sw=2
set linebreak
set laststatus=2
set cmdheight=1
" set bg=dark
set background=dark
set t_Co=256
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
set hidden
set diffopt+=vertical
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors
set colorcolumn=80
set autoread
set listchars
set encoding=utf-8
set syntax
set noshowmode
set autowrite
set emoji
" set nowrap
set wrap
syntax on
" Make search easier
set smartcase
set ignorecase
" Visual indication of line your cursor is on, works in normal and visual mode
" set cursorline
set scrolloff=0
" set signcolumn " Already handled in coc config
" set mouse=a " Enabling use of mouse so that it can help scrolling of docs in floating windows
"set updatetime=300
set wildmode=longest,list,full
" }}}

