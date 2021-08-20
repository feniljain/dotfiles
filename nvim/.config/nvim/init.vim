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
" Use za to fold and unfold

" Vim Plugins ---------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')

" MISCELLANEOUS
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'Yggdroot/indentLine'
Plug 'farmergreg/vim-lastplace'
Plug 'christoomey/vim-system-copy'
Plug 'preservim/nerdtree'
Plug 'romgrk/winteract.vim'
Plug 'tpope/vim-surround'
" Plug 'diepm/vim-rest-console'
Plug 'lambdalisue/suda.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
" Plug 'Pocco81/ISuckAtSpelling.nvim'
" Plug 'rmagatti/auto-session'
" Plug 'rmagatti/session-lens'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'tpope/vim-commentary'
Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'folke/which-key.nvim'
" Plug 'lewis6991/spellsitter.nvim'
" Plug 'bfredl/nvim-luadev'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/lsp-colors.nvim' " Do not remove this it provides compatibility for highlighting, or it starts break badly
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'kosayoda/nvim-lightbulb'

" Syntax Highlighting
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'simrat39/symbols-outline.nvim'
Plug 'romgrk/nvim-treesitter-context'
Plug 'abecodes/tabout.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'drzel/vim-repo-edit'
Plug 'junegunn/gv.vim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'APZelos/blamer.nvim'

" HTML AND CSS AND JS
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" THEMES
Plug 'gruvbox-community/gruvbox'

" Rust
Plug 'cespare/vim-toml'
Plug 'simrat39/rust-tools.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
Plug 'wellle/tmux-complete.vim'

" RFCs
Plug 'ThePrimeagen/rfc-reader'

" Debugger
Plug 'puremourning/vimspector'

" Testing
Plug 'vim-test/vim-test'

" Plugins in dev
" Plug '~/Projects/Learn/vim/todomania'
call plug#end()
" }}}

" Unused plugins ---------------------- {{{
" Plug 'airblade/vim-rooter'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " For neovim client browser
" Plug 'p00f/nvim-ts-rainbow' " Do not install it alongside treesitter, vim
" will start lagging badly
" Plug 'dhruvasagar/vim-zoom' " Tmux like zoom in/out, <c-w>m
" Plug 'vimpostor/vim-tpipeline'
" Plug 'frazrepo/vim-rainbow'
" Plug 'RRethy/vim-illuminate'
" Plug '~/Projects/vim-learn/nnn.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'vimwiki/vimwiki'
" Plug 'mileszs/ack.vim'
" Plug 'Devil39/nnn.vim', { 'branch': 'develop' }
" Plug 'wellle/tmux-complete.vim'
" Plug 'mhinz/vim-startify'
" Plug 'preservih/tagbar'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale'
" Plug 'dense-analysis/ale'

" Protobuf
" Plug 'bufbuild/vim-buf'
" Plug 'uber/prototool', { 'rtp':'vim/prototool' }

" Plug 'fannheyward/coc-react-refactor'
" Plug 'neoclide/coc-eslint'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" DART AND FLUTTER
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'pangloss/vim-javascript'
" Plug 'flazz/vim-colorschemes'
" Plug 'ayu-theme/ayu-vim'
" Plug 'morhetz/gruvbox'
" Plug 'hzchirs/vim-material'
" Plug 'joshdick/onedark.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
" Plug 'arcticicestudio/nord-vim'
" Plug 'pineapplegiant/spaceduck'
" Plug 'srcery-colors/srcery-vim'
" Plug 'sainnhe/sonokai'
" Plug 'tomasiser/vim-code-dark'
" Plug 'rktjmp/lush.nvim'
" Plug 'npxbr/gruvbox.nvim'
" Plug 'eddyekofo94/gruvbox-flat.nvim'
" Plug 'jsit/toast.vim'

" GOLANG
" Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
" Plug 'fatih/vim-go'

" RUST
" Plug 'rust-lang/rust.vim' " use alognwith coc-rls or coc-rust-analyzer
" Current use coc-rust-analyzer

" Statusline
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'
" Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'josa42/vim-lightline-coc'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Fuzzy Finders
" Plug 'junegunn/fzf.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'ggreer/the_silver_searcher'
" Plug 'nvim-telescope/telescope-media-files.nvim'

" Debugger
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'
" }}}

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

 autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

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

" Break bad habits in vim by getting a floating window alert ----------- {{{
" NOTE: Place in ~/.vim/autoload/breakhabits.vim
" function! breakhabits#createmappings(keys, message) abort
"     for key in a:keys
"          call nvim_set_keymap('n', key, ':call BreakHabitsWindow(' . string(a:message). ')<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
"     endfor
" endfunction

function! BreakHabitsWindow(message) abort
    " Define the size of the floating window
    let width = 50
    let height = 10

    " Create the scratch buffer displayed in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " create the lines to draw a box
    let horizontal_border = '+' . repeat('-', width - 2) . '+'
    let empty_line = '|' . repeat(' ', width - 2) . '|'
    let lines = flatten([horizontal_border, map(range(height-2), 'empty_line'), horizontal_border])
    " set the box in the buffer
    call nvim_buf_set_lines(buf, 0, -1, v:false, lines)

    " Create the lines for the centered message and put them in the buffer
    let offset = 0
    for line in a:message
        let start_col = (width - len(line))/2
        let end_col = start_col + len(line)
        let current_row = height/2-len(a:message)/2 + offset
        let offset = offset + 1
        call nvim_buf_set_text(buf, current_row, start_col, current_row, end_col, [line])
    endfor

    " Set mappings in the buffer to close the window easily
    let closingKeys = ['<Esc>', '<CR>', '<Leader>']
    for closingKey in closingKeys
        call nvim_buf_set_keymap(buf, 'n', closingKey, ':close<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
    endfor

    " Create the floating window
    let ui = nvim_list_uis()[0]
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'anchor': 'NW',
                \ 'style': 'minimal',
                \ }
    let win = nvim_open_win(buf, 1, opts)

    " Change highlighting
    call nvim_win_set_option(win, 'winhl', 'Normal:ErrorFloat')
endfunction
" }}}

" Let Commands ---------------------- {{{
" Fixing clipboard warning
let g:loaded_clipboard_provider = 1

" vim-rainbow config
" let g:rainbow_active = 1

" Vim-go config
let g:go_gopls_enabled = 1
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_popup_window = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
" Status line types/signatures
" let g:go_auto_type_info = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_def_mode = "gopls"
let g:go_info_mode= "gopls"

let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_map = v:true
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:dart_style_guide = 2
let g:ackprg = 'ag --vimgrep'

let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#statusline = 1

" Syntax highlighting for lua in vim files
let g:vimsyn_embed = 'l'

let g:gitgutter_enabled = 1
" }}}

" Vim JS Config ---------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM JS CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:ale_fixers = {
" \ 'javascript': ['eslint']
" \ }
"
"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
"
"let g:ale_fix_on_save = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" }}}

" Change font size quickly ---------------------- {{{
" Use ctrl Shift + -> Increase font size
" Use ctrl - -> Decrease font size
" }}}

" Read pdfs in vim(Needs some refinement) ---------------------- {{{
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
" }}}

" Ale proto config ---------------------- {{{
"let g:ale_linters = {
"\   'proto': ['prototool-lint'],
"\}
"" \   'proto': ['buf-lint',],
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_linters_explicit = 1
"nnoremap <silent> <Space>buf :call PrototoolFormatFix()<CR>
" }}}

" Remove file name inclusion in search in rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nmap <silent> gof :exec '!gofmt -w '.expand('%:p')<CR>
" nmap <silent> gol :exec '!golint .'<CR>
nmap <silent> gol :exec '!golint '.expand('%:p')<CR>

nnoremap <Space>m :MaximizerToggle<CR>
" nmap <silent> rof :exec '!rustfmt -w '.expand('%:p')<CR>
