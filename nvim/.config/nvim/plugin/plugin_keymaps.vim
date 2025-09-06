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

" ----------------------------- NERD-TREE -----------------------------
nnoremap <Space>nf :NERDTreeFind<CR>
nnoremap <Space>nt :NERDTreeToggle<CR>

" ----------------------------- NO-NECK-PAIN -----------------------------
nnoremap <Space>np :NoNeckPain<CR>

" ----------------------------- Aerial -----------------------------
nnoremap <Space>so :AerialToggle!<CR>

" ----------------------------- VIM-FUGITIVE -----------------------------
noremap <Space>gm :Gdiffsplit!<CR>
noremap <Space>gl :diffget //2<CR>
noremap <Space>gr :diffget //3<CR>
noremap <Space>gw :Gwrite!<CR>

" ----------------------------- TELESCOPE  -----------------------------
" ======== Files search ========
nnoremap tgf :lua require('telescope.builtin').git_files()<CR>

nnoremap tf :lua require('telescope.builtin').find_files()<CR>

nnoremap tt :lua require('telescope.builtin').buffers()<CR>

nnoremap tr :lua require('telescope.builtin').registers()<CR>

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

nnoremap tht :lua require('telescope.builtin').help_tags()<CR>

nnoremap tb :lua require('telescope.builtin').builtin()<CR>


" ======== Misc ========
nnoremap td :lua require('plugins.telescope').search_dotfiles()<CR>

nnoremap tgb :lua require('telescope.builtin').git_branches()<CR>

" ======== Misc extensions commands ========
nnoremap tgw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

" ======== Maximizer ========
nnoremap <Space>m :MaximizerToggle<CR>
