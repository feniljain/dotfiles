return {
    {
        "nvim-lua/popup.nvim",
    },
    {
        "nvim-lua/plenary.nvim",
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
        "szw/vim-maximizer",
    },
    {
        "itchyny/vim-qfedit",
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
        "nacro90/numb.nvim",
        config = true,
    },
    {
        "m4xshen/hardtime.nvim",
        config = true,
    },
    {
        'echasnovski/mini.operators',
        version = '*',
        config = function()
            -- Set prefix to empty string to disable this functionality and automatic set keymap of its
            require('mini.operators').setup({
                evaluate = { prefix = '' },
                exchange = { prefix = '' },
                multiply = { prefix = '' },
                replace = { prefix = 'cr', reindent_linewise = true, }, -- We are only interested in replace feature
                sort = { prefix = '' },
            })
            -- keymaps to leverage:
            -- - criw, replace word with value in register
            -- - crr, replace line with value in register
            -- - cr in visual mode, replace visual selection with value in register
        end
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
