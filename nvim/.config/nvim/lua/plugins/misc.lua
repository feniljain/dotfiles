return {
    {
        "nvim-lua/popup.nvim",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nacro90/numb.nvim",
        config = true,
    },
    {
        "farmergreg/vim-lastplace",
    },
    {
        "christoomey/vim-system-copy",
    },
    {
        "preservim/nerdtree",
    },
    {
        "romgrk/winteract.vim",
    },
    {
        "lambdalisue/suda.vim",
    },
    {
        "rcarriga/nvim-notify",
        config = true,
    },
    {
        "shortcuts/no-neck-pain.nvim",
        config = true,
    },
    {
        "szw/vim-maximizer",
    },
    {
        "m4xshen/hardtime.nvim",
        config = true,
    },
    {
        "itchyny/vim-qfedit",
    },
    {
        "hedyhli/outline.nvim",
        config = function()
            vim.keymap.set("n", "<Space>so", "<cmd>Outline<CR>",
                { desc = "Toggle Outline" })

            require("outline").setup { -- without call to `setup`, this plugin won't work
                keymaps = {
                    peek_location = 'p',
                    fold_toggle = 'o',
                },
            }
        end,
    },
}
