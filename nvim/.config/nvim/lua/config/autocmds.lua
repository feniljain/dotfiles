local vim = vim

vim.api.nvim_create_autocmd("BufHidden", {
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
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank-u-la-la', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- don't show numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
    command = [[setlocal nonumber norelativenumber]]
})

-- Resize Neovim split when terminal is resized
vim.api.nvim_command('autocmd VimResized * wincmd =')

vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Force commentstring to include spaces',
  -- group = ...,
  callback = function(event)
    local cs = vim.bo[event.buf].commentstring
    vim.bo[event.buf].commentstring = cs:gsub('(%S)%%s', '%1 %%s'):gsub('%%s(%S)', '%%s %1')
  end,
})
