local vim = vim

-- Reference blog post: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack.html

-- add back semver with version tag
-- remeber about custom loading function: { 'plugin-name', { load = function() end } }

vim.pack.add({
    -- ==============================================

    -- themes deps
    -- { 'https://github.com/luisiacc/gruvbox-baby' },
    'https://github.com/sainnhe/sonokai',

    -- ==============================================

    -- treesitter deps
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    'https://github.com/romgrk/nvim-treesitter-context',

    -- ==============================================

    -- telescope deps
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-fzy-native.nvim',
    'https://github.com/nvim-telescope/telescope-live-grep-args.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',

    -- ==============================================

    -- LSP deps
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/folke/trouble.nvim',

    -- ==============================================

    -- git deps
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/sindrets/diffview.nvim',
    'https://github.com/lewis6991/gitsigns.nvim',
    { src = 'https://github.com/feniljain/git-worktree.nvim', version = 'fixes' },

    -- ==============================================

    -- blink deps
    { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },

    -- ==============================================

    -- misc deps
    'https://github.com/farmergreg/vim-lastplace',
    'https://github.com/vim-test/vim-test',
    'https://github.com/christoomey/vim-system-copy',
    'https://github.com/preservim/nerdtree',
    'https://github.com/romgrk/winteract.vim',
    'https://github.com/szw/vim-maximizer',
    'https://github.com/itchyny/vim-qfedit',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/stevearc/aerial.nvim',
    'https://github.com/MagicDuck/grug-far.nvim',
    'https://github.com/shortcuts/no-neck-pain.nvim',
    'https://github.com/nacro90/numb.nvim',

    -- ==============================================
})
