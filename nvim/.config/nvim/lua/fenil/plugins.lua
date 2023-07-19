return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'szw/vim-maximizer'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'
    -- use 'Yggdroot/indentLine' -- removing coz: https://www.reddit.com/r/neovim/comments/101omgs/comment/j2p62tq/
    use 'nacro90/numb.nvim'
    use 'farmergreg/vim-lastplace'
    use 'christoomey/vim-system-copy'
    use 'preservim/nerdtree'
    use 'romgrk/winteract.vim'
    use 'tpope/vim-surround'
    use 'lambdalisue/suda.vim'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-commentary'
    use 'sbdchd/neoformat'
    use 'rcarriga/nvim-notify'
    use 'ojroques/nvim-osc52'
    use 'shortcuts/no-neck-pain.nvim'

    --  JAKT
    -- use 'SerenityOS/jakt', { 'rtp': 'editors/vim' }

    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'L3MON4D3/LuaSnip'
    -- use 'tamago324/nlsp-settings.nvim'

    --  Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'

    -- cmp Path completion
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'andersevenrud/cmp-tmux'
    use 'hrsh7th/cmp-emoji'
    -- use 'hrsh7th/cmp-cmdline'

    use 'folke/lsp-colors.nvim' -- Do not remove this it provides compatibility for highlighting, or it starts breaking badly
    use 'glepnir/lspsaga.nvim'
    use 'folke/trouble.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind-nvim'

    -- Syntax Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'simrat39/symbols-outline.nvim'
    use 'romgrk/nvim-treesitter-context'

    -- Fuzzers
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'nvim-telescope/telescope-live-grep-args.nvim'
    use 'crispgm/telescope-heading.nvim'

    use 'junegunn/fzf.vim'
    -- use 'junegunn/fzf', { 'do': { -> fzf#install() } }
    use {
        'junegunn/fzf',
        run = 'fzf#install()'
    }

    -- GIT
    -- use 'airblade/vim-gitgutter'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use {
        'feniljain/git-worktree.nvim',
        branch = 'fixes'
    }

    -- HTML AND CSS AND JS
    -- use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'MunifTanjim/eslint.nvim'

    -- THEMES
    use 'gruvbox-community/gruvbox'
    use 'Yazeed1s/minimal.nvim'
    use 'folke/tokyonight.nvim'

    -- Statusline
    -- use 'hoob3rt/lualine.nvim'
    use '~/Projects/tmp/lualine.nvim'
    use 'arkav/lualine-lsp-progress'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy'
    }
    -- use 'romgrk/barbar.nvim'
    -- use 'wellle/tmux-complete.vim'

    -- Debugger
    use 'puremourning/vimspector'

    -- Testing
    use 'vim-test/vim-test'
end)
