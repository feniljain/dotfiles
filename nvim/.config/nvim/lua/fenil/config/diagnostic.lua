-- diagnostics related configs
--
-- =======================================================================================

-- Highlight line number instead of having icons in sign column

vim.api.nvim_set_hl(0, "DiagnosticLineNrError", {bold = true, fg = "#FF0000", bg = "#51202A"})
vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", {bold = true, fg = "#FFA500", bg = "#51412A"})
vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", {bold = true, fg = "#00FFFF", bg = "#1E535D"})
vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", {bold = true, fg = "#0000FF", bg = "#1E205D"})

vim.diagnostic.config({
    underline = true,
    update_in_insert = true,
    severity_sort = false,
    virtual_lines = false, -- ugly
    float = {
        header = false,
        border = 'rounded',
        focusable = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticLineNrError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticLineNrWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticLineNrInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticLineNrHint',
        },
    },
})

-- =======================================================================================

-- show popup with diagnostic information when cursor is on the location

vim.api.nvim_create_autocmd("CursorHold", {
    buf = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

-- =======================================================================================
