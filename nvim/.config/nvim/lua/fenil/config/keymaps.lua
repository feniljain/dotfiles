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

-- =======================================================================================

-- Vanilla Bindings ported to lua

vim.keymap.set("i", "jk", "<esc>")

-- To force myself to learn to use new esc key: 'jk', and also not use any
-- arrow keys
vim.keymap.set("i", "<esc>", "<nop>")
vim.keymap.set("i", "<OA>", "<nop>")
vim.keymap.set("i", "<OB>", "<nop>")
vim.keymap.set("i", "<OD>", "<nop>")
vim.keymap.set("i", "<OC>", "<nop>")

vim.keymap.set({"n", "v", "o"}, "<C-l>", ":tabn<CR>")
vim.keymap.set({"n", "v", "o"}, "<C-h>", ":tabp<CR>")
vim.keymap.set({"n", "v", "o"}, "<C-n>", ":tabnew<CR>")

-- Remove the highlighting from previous search
vim.keymap.set("n", "<Space>rh", ":nohlsearch<CR>")
-- Print pwd
vim.keymap.set("n", "<Space>cd", ":!pwd<CR>")

-- To open vimrc in a new vertical split
vim.keymap.set("n", "<Space>ev", ":vsplit $MYVIMRC<cr>")
-- To source vimrc quickly
vim.keymap.set("n", "<Space>sv", ":source $MYVIMRC<cr>")
-- for indenting the whole code
vim.keymap.set({"n", "v", "o"}, "<Space>ic", "=G<CR>")
-- For opening explore
vim.keymap.set({"n", "v", "o"}, "<Space>of", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")

-- Pane navigation
vim.keymap.set({"n", "v", "o"}, "<Space>h", "<C-W>h")
vim.keymap.set({"n", "v", "o"}, "<Space>j", "<C-W>j")
vim.keymap.set({"n", "v", "o"}, "<Space>k", "<C-W>k")
vim.keymap.set({"n", "v", "o"}, "<Space>l", "<C-W>l")

-- neovim terminal mappings
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set({"n", "v", "o"}, "<C-t>", ":terminal<CR>")

-- bunch of vim-unimpaired mappings are
-- shipped by default with nvim now(https://github.com/neovim/neovim/pull/28525/):
-- - ]b and [b for buffer navigation
-- - ]q and [q for quickfix list navigation
-- - ]t works with with ctags and LSP for tags

-- Work with buffers faster
vim.keymap.set("n", "<Space>cb", ":bd<CR>", { silent = true })

-- Window split shortcuts
vim.keymap.set("n", "<Space>v", ":vsplit<CR>")
vim.keymap.set("n", "<Space>-", ":split<CR>")

-- Use Y to automatically select to the end of the line
vim.keymap.set("n", "Y", "y$")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- This also centers screen while jumping in search
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Undo break points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- Jumplist mutation
-- vim.keymap.set("n", "k", function() return (vim.v.count > 5 and "m'" .. vim.v.count or "") .. "k" end, { expr = true })
-- vim.keymap.set("n", "j", function() return (vim.v.count > 5 and "m'" .. vim.v.count or "") .. "j" end, { expr = true })

-- Moving lines around in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Better indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- In this (https://www.youtube.com/watch?v=uL9oOZStezw) video prime
-- complains about not using {} for jumping through code blocks because they
-- add items to jumplist, someone in the comment gives this solution:
vim.keymap.set("n", "{", function() vim.cmd("keepjumps norm! " .. vim.v.count1 .. "{") end)
vim.keymap.set("n", "}", function() vim.cmd("keepjumps norm! " .. vim.v.count1 .. "}") end)
