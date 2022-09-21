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


" ======== Neovim Core Search ========
noremap tt :Buffers<CR>

nnoremap th :lua require('telescope.builtin').help_tags()<CR>

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
