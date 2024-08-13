-- TODO:
-- Figure out how to convert these into vimscript??

local vim = vim

vim.keymap.set("n", "<Space>cab", ":%bd|e#|bd# <CR>")
vim.keymap.set('v', '/', '<Esc>/\\%V')
