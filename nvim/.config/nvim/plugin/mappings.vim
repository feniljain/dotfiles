" Mappings ---------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""


"Grep basic the highlighting
" nnoremap <leader>g :silent execute ":grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" nnoremap <space>rm :execute ":!rusty-man " . shellescape(expand("<cWORD>"))
nnoremap <Space>rm !rusty-man Arc<CR>

" VIM-SPECIFIC MAPPINGS
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

" Press Ctrl-u in insert mode to convert current word under cursor to uppercase
" inoremap <C-u> jkviwU
" Press Ctrl-u in normal mode to convert current word under cursor to uppercase
" nnoremap <C-u> viwU

" NERDTree bindings
nnoremap <Space>nf :NERDTreeFind<CR>
nnoremap <Space>nt :NERDTreeToggle<CR>

"Remove the highlighting from previous search
nnoremap <Space>rh :nohlsearch<CR>
" Print pwd
nnoremap <Space>cd :!pwd<CR>

" To open vimrc in a new vertical split
nnoremap <Space>ev :vsplit $MYVIMRC<cr>
" To source vimrc quickly
nnoremap <Space>sv :source $MYVIMRC<cr>
" To source dir lua quickly
" nnoremap <Space>sl :luafile ~/.config/nvim/lua<cr>
" To source current lua quickly
nnoremap <Space>sl :luafile %<cr>
"Match all the texts which have a trailing space
" nnoremap <leader>w :match Error /\v...\s/<CR>
"Remove highlighting done by previous command
" nnoremap <leader>W :match none<CR>
"Start the search with \v regex mode of vim
"nnoremap / /\v
" for identing the whole code
noremap <Space>ic =G<CR>
" For opening explore
noremap <Space>of :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" noremap <Space>tt :wincmd x<bar> :term <bar> :splitbelow resize 30<CR>
noremap <Space>ex :Ex<CR>

" Pane navigation
noremap <Space>h <C-W>h
noremap <Space>j <C-W>j
noremap <Space>k <C-W>k
noremap <Space>l <C-W>l

" neovim terminal mappings
tnoremap jk <C-\><C-n>
" noremap <C-t> :terminal<CR>

" VIM-ZOOM REMAP
" noremap <Space>vz <C-W>m

" MISCELLANEOUS MAPPINGS

noremap  <Space>` :Goyo<CR>
"noremap  <Space>k :Goyo!<CR>

" Fix floating windows problem
" inoremap <C-c> <ESC>

" Navigate quickfix list with ease for ack.vim
"nnoremap <silent> [q :cprevious<CR>
"nnoremap <silent> [q :cnext<CR>
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprevious<CR>
" nnoremap <silent> <C-q> :cw<CR> " Replaced by function QuickFixToggle()

" Winteract Settings
nmap <Space>rw :InteractiveWindow<CR>

" Window split shortcuts
nnoremap <Space>v :vsplit<CR>
nnoremap <Space>- :split<CR>

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
" }}}

" In this (https://www.youtube.com/watch?v=uL9oOZStezw) video prime
" complains about not using {} and for jumping
" through code blocks because they add items to jumplist, someone in
" the comment gives this solution:
" map("n", "{", ":execute 'keepjumps norm! ' . v:count1 . '{'<CR>")
" map("n", "}", ":execute 'keepjumps norm! ' . v:count1 . '}'<CR>")
" Convert to vimscript
nnoremap { :execute 'keepjumps norm! ' . v:count1 . '{'<CR>
nnoremap } :execute 'keepjumps norm! ' . v:count1 . '}'<CR>
