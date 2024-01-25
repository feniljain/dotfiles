" ----------------------------- VIMSPECTOR -----------------------------
" nnoremap <Space>m <C-W>m
nnoremap <Space>dd :call vimspector#Launch()<CR>
nnoremap <Space>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <Space>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <Space>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <Space>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <Space>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <Space>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <Space>de :call vimspector#Reset()<CR>

nnoremap <Space>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <Space>dl <Plug>VimspectorStepInto
nmap <Space>dj <Plug>VimspectorStepOver
nmap <Space>dk <Plug>VimspectorStepOut
nmap <Space>d_ <Plug>VimspectorRestart
nnoremap <Space>d<space> :call vimspector#Continue()<CR>

nmap <Space>drc <Plug>VimspectorRunToCursor
nmap <Space>dbp <Plug>VimspectorToggleBreakpoint
nmap <Space>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" for normal mode - the word under the cursor
nmap <Space>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Space>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame

" ----------------------------- VIM-TEST -----------------------------
nnoremap <Space>tn :TestNearest<CR>
nnoremap <Space>tf :TestFile<CR>
nnoremap <Space>tl :TestLast<CR>

" ----------------------------- Terminal Custom Script -----------------------------
" ANKI: Make a small terminal at the bottom of the screen.
nnoremap <Space>st :call <SID>small_terminal()<CR>

" ----------------------------- NERD-TREE -----------------------------
nnoremap <Space>nf :NERDTreeFind<CR>
nnoremap <Space>nt :NERDTreeToggle<CR>

" ----------------------------- NO-NECK-PAIN -----------------------------
nnoremap <Space>np :NoNeckPain<CR>

" ----------------------------- LUA DEV -----------------------------
" save and resource current file
nnoremap <Space>x :call <SID>save_and_exec()<CR>

" ----------------------------- HARPOON -----------------------------
nmap <leader>hq :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nmap <leader>a :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>s :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>d :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>f :lua require("harpoon.ui").nav_file(4)<CR>
nmap <leader>ta :lua require("harpoon.term").gotoTerminal(1)<CR>
nmap <leader>ts :lua require("harpoon.term").gotoTerminal(2)<CR>
nmap <leader>td :lua require("harpoon.term").gotoTerminal(3)<CR>
nmap <leader>va :lua require("harpoon.term").sendCommand(1, 1)<CR>
nmap <leader>vs :lua require("harpoon.term").sendCommand(1, 2)<CR>
nmap <leader>vd :lua require("harpoon.term").sendCommand(1, 3)<CR>
nmap <leader>vf :lua require("harpoon.term").sendCommand(1, 4)<CR>
nmap <leader>ca :lua require("harpoon.term").sendCommand(2, 1)<CR>
nmap <leader>cs :lua require("harpoon.term").sendCommand(2, 2)<CR>
" nmap <Space>ha :call GotoBuffer(0)<CR>
" unmap ;w " Unmapping commands
" unmap ;r
" unmap ;e
"
" nmap <leader>hr :lua require("harpoon.mark").rm_file()<CR>
" nmap <leader>hr1 :lua require("harpoon.mark").rm_file(1)<CR>
" nmap <leader>hc :lua require("harpoon.mark").clear_all()<CR>
"
" Navigation
"nmap <C-q> :lua require("harpoon.ui").nav_file(1)<CR>
" nmap <leader>ca :lua require("harpoon.mark").set_current_at(1)<CR>
" nmap <leader>cs :lua require("harpoon.mark").set_current_at(2)<CR>
" nmap <leader>cd :lua require("harpoon.mark").set_current_at(3)<CR>
" nmap <leader>cf :lua require("harpoon.mark").set_current_at(4)<CR>
" nmap <leader>ra :lua require("harpoon.mark").rm_file(1)<CR>
" nmap <leader>rs :lua require("harpoon.mark").rm_file(2)<CR>
" nmap <leader>rd :lua require("harpoon.mark").rm_file(3)<CR>
" nmap <leader>rf :lua require("harpoon.mark").rm_file(4)<CR>

" ----------------------------- VIM-FUGITIVE -----------------------------
noremap <Space>gm :Gdiffsplit!<CR>
noremap <Space>gl :diffget //2<CR>
noremap <Space>gr :diffget //3<CR>
noremap <Space>gw :Gwrite!<CR>

" ----------------------------- FZF  -----------------------------
noremap <Space>fs :Rg<CR>
noremap <Space>ff :Files<CR>

" ----------------------------- COMMENTARY  -----------------------------
nnoremap <Space><Space> :Commentary<cr>
vnoremap <Space><Space> :Commentary<cr>

" ----------------------------- TELESCOPE  -----------------------------
" ======== Files search ========
nnoremap tgf :lua require('telescope.builtin').git_files()<CR>

nnoremap tf :lua require('telescope.builtin').find_files()<CR>

" Mapping is defined one more because in netrw t is supposed to be reserved and it doesnt respect other mappings
" nnoremap `f :lua require('telescope.builtin').find_files()<CR>


" ======== Text search ========
" telescope exact search
nnoremap tes :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" telescope search
nnoremap ts :lua require('telescope.builtin').live_grep()<CR>

" telescope word search
nnoremap tws :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" telescope args search ( more like search with args )
nnoremap tas :lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>

" ======== Winteract ========
nmap <Space>rw :InteractiveWindow<CR>

" ======== Neovim Core Search ========
noremap tt :Buffers<CR>

nnoremap tht :lua require('telescope.builtin').help_tags()<CR>

nnoremap tb :lua require('telescope.builtin').builtin()<CR>

" Using fzf's default buffer search, as it has a handy out-of-the-box option
" for going to the the buffer if it is already open instead of opening it in
" current buffer everytime
" nnoremap tt :lua require('telescope.builtin').buffers()<CR>


" ======== Misc ========
nnoremap td :lua require('fenil.telescope').search_dotfiles()<CR>

nnoremap tgb :lua require('fenil.telescope').git_branches()<CR>

" nnoremap tx :lua require('fenil.telescope').switch_projects()<CR>
" nnoremap tx :lua require('session-lens').search_session()<CR>


" ======== Misc extensions commands ========
nnoremap tp :lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>

nnoremap tgw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

nnoremap tgc :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
" nnoremap tgc :lua require('git-worktree').create_worktree()

" Inspired from gO of man pages
nnoremap tO :Telescope heading<CR>

" ======== Specific LSP Commands ========
nnoremap <space>p :Prettier<CR>
