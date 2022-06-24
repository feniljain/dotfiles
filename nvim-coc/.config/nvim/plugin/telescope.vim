nnoremap ts :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap tg :lua require('telescope.builtin').git_files()<CR>
nnoremap tf :lua require('telescope.builtin').find_files()<CR>
" Mapping is defined one more because in netrw t is supposed to be reserved and it doesnt respect other mappings
" nnoremap `f :lua require('telescope.builtin').find_files()<CR>

nnoremap tcs :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" nnoremap tt :lua require('telescope.builtin').buffers()<CR>
nnoremap tt :Buffers <CR>
nnoremap tb :lua require('telescope.builtin').builtin()<CR>
nnoremap th :lua require('telescope.builtin').help_tags()<CR>
nnoremap td :lua require('fenil.telescope').search_dotfiles()<CR>
nnoremap tgb :lua require('fenil.telescope').git_branches()<CR>
" nnoremap tx :lua require('fenil.telescope').switch_projects()<CR>
" nnoremap tx :lua require('session-lens').search_session()<CR>

" nnoremap tp :lua require('telescope').extensions.project.project{display_type = 'full'}<CR>
nnoremap tp :lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>
nnoremap tgw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap tgc :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
" nnoremap tgc :lua require('git-worktree').create_worktree()
