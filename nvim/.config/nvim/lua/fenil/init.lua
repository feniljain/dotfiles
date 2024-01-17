require("fenil.plugins")
require("fenil.cmp")
require("fenil.lualine")
require("fenil.telescope")
require("fenil.treesitter")
require("fenil.fidget")
require("fenil.lsp")
require("fenil.lsp-trouble")
require("fenil.nvim-autopairs")
require("fenil.symbolsoutline")
require("fenil.play")
require("fenil.notify")
require("fenil.osc52")
require("fenil.null-ls")
require("fenil.prettier")
require("fenil.eslint")
require("fenil.harpoon")
require("fenil.numb")
require("fenil.gitsigns")
require("fenil.navic")
require("fenil.diagnostic")
-- require("fenil.rust-tools")

-- require("fenil.whid")

local vim = vim

-- Resize Neovim split when terminal is resized
vim.api.nvim_command('autocmd VimResized * wincmd =')

-- don't show numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
    command = [[setlocal nonumber norelativenumber]]
})

