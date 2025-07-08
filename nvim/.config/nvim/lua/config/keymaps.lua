-- TODO:
-- Figure out how to convert these into vimscript??

local vim = vim

vim.keymap.set("n", "<Space>cab", ":%bd|e#|bd# <CR>")
vim.keymap.set('v', '/', '<Esc>/\\%V')

-- https://github.com/stevedylandev/dotfiles/blob/main/nvim/lua/keymaps.lua
-- If I visually select words and paste from clipboard, don't replace my
-- clipboard with the selected word, instead keep my old word in the
-- clipboard
vim.keymap.set("x", "p", '"_dP', { silent = true, noremap = true })

-- . repeat or execute macro on all visually selected lines
-- eg. press A"<esc> on line one, select all others, press . and they all end in "
-- https://www.reddit.com/r/neovim/comments/1abd2cq/comment/kjn1kww/
-- map("x", ".", ":norm .<CR>", { silent = false })
-- map("x", "@", ":norm @q<CR>", { silent = false })

-- https://yobibyte.github.io/vim.html
vim.keymap.set("n", "<Space>c", function()
  vim.ui.input({}, function(c) 
      if c and c~="" then 
        vim.cmd("noswapfile vnew") 
        vim.bo.buftype = "nofile"
        vim.bo.bufhidden = "wipe"
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
      end 
  end) 
end)
