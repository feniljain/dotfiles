local vim = vim

local group = vim.api.nvim_create_augroup("autocmds-group", { clear = true })

vim.api.nvim_create_autocmd("BufHidden", {
    group = group,
    desc = "Delete [No Name] buffers",
    callback = function(event)
        if event.file == "" and vim.bo[event.buf].buftype == "" and not vim.bo[event.buf].modified then
            vim.schedule(function() pcall(vim.api.nvim_buf_delete, event.buf, {}) end)
        end
    end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    group = group,
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

-- don't show numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = group,
    desc = 'Dont show number/relativenumbers in terminal',
    command = [[setlocal nonumber norelativenumber]]
})

-- Remove trailing white spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  desc = "Remove trailing spaces on save",
  pattern = "*.*",
  command = [[%s/\s\+$//e]],
})
