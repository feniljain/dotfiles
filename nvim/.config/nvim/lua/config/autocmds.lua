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

-- when cmdheight is 0, it does not show macro record message, that's why add this
-- https://vi.stackexchange.com/questions/39947/nvim-vim-o-cmdheight-0-looses-the-recording-a-macro-messages
-- vim.cmd [[ autocmd RecordingEnter * set cmdheight=1 ]]
-- vim.cmd [[ autocmd RecordingLeave * set cmdheight=0 ]]

-- vim.cmd [[ autocmd CmdlineEnter * set cmdheight=1 ]]
-- vim.cmd [[ autocmd CmdlineLeave * set cmdheight=0 ]]

-- Automatically increase cmdheight when entering search
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = { "/", "?" },
  callback = function()
    if vim.o.cmdheight == 0 then
      vim.opt.cmdheight = 1
      vim.g._cmdheight_restored = false
    end
  end,
})

-- Restore cmdheight when leaving command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = { "/", "?" },
  callback = function()
    if not vim.g._cmdheight_restored then
      vim.opt.cmdheight = 0
      vim.g._cmdheight_restored = true
    end
  end,
})
