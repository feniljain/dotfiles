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
 Plug 'lambdalisue/suda.vim'
 Plug 'windwp/nvim-autopairs'
 Plug 'tpope/vim-commentary'
 Plug 'sbdchd/neoformat'
 Plug 'rcarriga/nvim-notify'
 Plug 'ojroques/nvim-osc52'
" JAKT
 Plug 'SerenityOS/jakt', { 'rtp': 'editors/vim' }

 " LSP
 Plug 'neovim/nvim-lspconfig'
 Plug 'williamboman/nvim-lsp-installer'
 Plug 'L3MON4D3/LuaSnip'

" Completion
 Plug 'hrsh7th/nvim-cmp'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'saadparwaiz1/cmp_luasnip'
 " cmp Path completion
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'andersevenrud/cmp-tmux'
 Plug 'hrsh7th/cmp-emoji'
 " Plug 'hrsh7th/cmp-cmdline'

 Plug 'folke/lsp-colors.nvim' " Do not remove this it provides compatibility for highlighting, or it starts break badly
 Plug 'glepnir/lspsaga.nvim'
 Plug 'folke/trouble.nvim'
 Plug 'ray-x/lsp_signature.nvim'
 Plug 'nvim-lua/lsp-status.nvim'
 Plug 'onsails/lspkind-nvim'
 Plug 'kosayoda/nvim-lightbulb'

 " Syntax Highlighting
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-treesitter/playground'
 Plug 'simrat39/symbols-outline.nvim'
 Plug 'romgrk/nvim-treesitter-context'
 Plug 'abecodes/tabout.nvim'

 " Fuzzers
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzy-native.nvim'
 Plug 'nvim-telescope/telescope-project.nvim'
 Plug 'nvim-telescope/telescope-live-grep-args.nvim'
 Plug 'olacin/telescope-cc.nvim'
 Plug 'crispgm/telescope-heading.nvim'

 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

 " GIT
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'drzel/vim-repo-edit'
 Plug 'junegunn/gv.vim'
 Plug 'ThePrimeagen/git-worktree.nvim'

 " HTML AND CSS AND JS
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'jose-elias-alvarez/null-ls.nvim'
 Plug 'MunifTanjim/prettier.nvim'
 Plug 'MunifTanjim/eslint.nvim'

 " THEMES
 Plug 'gruvbox-community/gruvbox'
 Plug 'Yazeed1s/minimal.nvim'

 " Rust
 Plug 'cespare/vim-toml'
 Plug 'simrat39/rust-tools.nvim'

 " Statusline
 Plug 'hoob3rt/lualine.nvim'
 Plug 'arkav/lualine-lsp-progress'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'j-hui/fidget.nvim'
 " Plug 'romgrk/barbar.nvim'
 " Plug 'wellle/tmux-complete.vim'

 " Debugger
 Plug 'puremourning/vimspector'

 " Testing
 Plug 'vim-test/vim-test'

 " Plugins in dev
 Plug '~/Projects/Learn/vim/todomania'
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
" Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'APZelos/blamer.nvim'
" Plug 'sudormrfbin/cheatsheet.nvim'
 " Plug 'diepm/vim-rest-console'
 " Plug 'Pocco81/ISuckAtSpelling.nvim'
 " Plug 'rmagatti/auto-session'
 " Plug 'rmagatti/session-lens'
 " Plug 'folke/which-key.nvim'
 " Plug 'lewis6991/spellsitter.nvim'
 " Plug 'bfredl/nvim-luadev'
 " Plug 'jiangmiao/auto-pairs'

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

" RFCs
" Plug 'ThePrimeagen/rfc-reader'

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
