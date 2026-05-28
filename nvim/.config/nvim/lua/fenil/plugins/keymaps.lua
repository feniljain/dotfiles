-- plugin related keymaps

-- vim.keymap.set has remap as `false` by default

-- ----------------------------- VIM-TEST -----------------------------
vim.keymap.set('n', '<Space>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Space>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Space>tl', ':TestLast<CR>')

-- ----------------------------- NERD-TREE -----------------------------
vim.keymap.set('n', '<Space>nf', ':NERDTreeFind<CR>')
vim.keymap.set('n', '<Space>nt', ':NERDTreeToggle<CR>')

-- ----------------------------- NO-NECK-PAIN -----------------------------
vim.keymap.set('n', '<Space>np', ':NoNeckPain<CR>')

-- ----------------------------- Aerial -----------------------------
vim.keymap.set('n', '<Space>so', ':AerialToggle!<CR>')

-- ----------------------------- VIM-FUGITIVE -----------------------------

vim.keymap.set('n', '<Space>gm', ':Gdiffsplit!<CR>')
vim.keymap.set('n', '<Space>gl', ':diffget //2<CR>')
vim.keymap.set('n', '<Space>gr', ':diffget //3<CR>')
vim.keymap.set('n', '<Space>gw', ':Gwrite!<CR>')

-- ----------------------------- WINTERACT  -----------------------------
vim.keymap.set('n', '<Space>rw', ':InteractiveWindow<CR>')

-- ----------------------------- MAXIMIZER  -----------------------------
vim.keymap.set('n', '<Space>m', ':MaximizerToggle<CR>')

-- ----------------------------- TELESCOPE  -----------------------------
-- ======== Files search ========

vim.keymap.set('n', 'tgf', require('telescope.builtin').git_files)
vim.keymap.set('n', 'tf', require('telescope.builtin').find_files)
vim.keymap.set('n', 'tt', require('telescope.builtin').buffers)
vim.keymap.set('n', 'tr', require('telescope.builtin').registers)

-- ======== Text search ========
-- telescope exact search
vim.keymap.set('n', 'tes', function()
        require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
    end
)

-- telescope search
vim.keymap.set('n', 'ts', require('telescope.builtin').live_grep)

-- telescope word search
vim.keymap.set('n', 'tws', function()
        require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
    end
)

-- telescope args search ( more like search with args )
vim.keymap.set('n', 'tae', require("telescope").extensions.live_grep_args.live_grep_args)

-- ======== Neovim Core Search ========
vim.keymap.set('n', 'tht', require('telescope.builtin').help_tags)

vim.keymap.set('n', 'tb', require('telescope.builtin').builtin)

-- ======== Misc ========
vim.keymap.set('n', 'tgb', require('telescope.builtin').git_branches)

-- ======== Misc extensions commands ========
vim.keymap.set('n', 'tgw', require('telescope').extensions.git_worktree.git_worktrees)

vim.keymap.set('n', 'tgw', require('telescope').extensions.git_worktree.git_worktrees)

vim.keymap.set('n', 'tgw', require('telescope').extensions.git_worktree.git_worktrees)
