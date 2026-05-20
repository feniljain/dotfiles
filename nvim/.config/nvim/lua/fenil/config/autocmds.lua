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

-- replace fidget.nvim: https://www.reddit.com/r/neovim/comments/1scg235/comment/oedgldy/
vim.api.nvim_create_autocmd('LspProgress', {
  group = group,
  desc = 'show lsp progress messages in ui2',
  callback = function(ev)
    local value = ev.data.params.value
    vim.api.nvim_echo({ { value.message or 'done' } }, false, {
      id = 'lsp.' .. ev.data.client_id,
      kind = 'progress',
      source = 'vim.lsp',
      title = value.title,
      status = value.kind ~= 'end' and 'running' or 'success',
      percent = value.percentage,
    })
  end,
})

-- Remove trailing white spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  desc = "Remove trailing spaces on save",
  pattern = "*.*",
  command = [[%s/\s\+$//e]],
})

-- Neovim only sometimes prints `recording @` when recording macros with cmdheight=0.
-- So leave a manual message to indicate recording indeed has started.

vim.api.nvim_create_autocmd("RecordingEnter", {
    group = group,
    callback = function()
        vim.api.nvim_echo({{"recording macro"}}, false, {})
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    group = group,
    callback = function()
        vim.api.nvim_echo({{"done recording macro"}}, false, {})
    end,
})
