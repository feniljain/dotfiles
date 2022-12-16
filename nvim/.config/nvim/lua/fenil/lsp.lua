local M = {}

local vim = vim

vim.lsp.set_log_level 'trace'

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require 'lspconfig'

local on_attach = function(client, bufnr)

    local cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

        hint_enable = false, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",

        handler_opts = {
            border = "rounded", -- double, rounded, single, shadow, none
        },
        decorator = { "`", "`" } -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help
    }

    require 'lsp_signature'.on_attach(cfg)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gpgd', '<cmd>Lspsaga peek_definition<CR>', bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', bufopts)
    vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gnr', '<cmd>Lspsaga rename<CR>', bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set({ 'n', 'v' }, 'gca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gcra', vim.lsp.buf.range_code_action, bufopts)
    vim.keymap.set({ 'n', 'v' }, 'gcra', vim.lsp.buf.range_code_action, bufopts)

    vim.keymap.set('n', 'gwd', '<cmd>TroubleToggle workspace_diagnostics<CR>', bufopts)
    vim.keymap.set('n', 'gfd', '<cmd>TroubleToggle document_diagnostics<CR>', bufopts)
    vim.keymap.set('n', 'gqf', '<cmd>TroubleToggle quickfix<CR>', bufopts)
    vim.keymap.set('n', 'gsd', '<cmd>TroubleToggle show_line_diagnostics<CR>', bufopts)

    vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', 'gsf', vim.lsp.buf.document_symbol, bufopts)
    vim.keymap.set('n', 'gsw', vim.lsp.buf.workspace_symbol, bufopts)

    vim.keymap.set('n', '<space>so', '<cmd>Lspsaga outline <CR>', bufopts) -- Not good enough as symbols-outline.nvim yet, check back in future

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
            hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
          ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    if false and client.server_capabilities.codeLensProvider then
        vim.cmd [[
           augroup lsp_document_codelens
             au! * <buffer>
             autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
             autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
           augroup END
        ]]
    end

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
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
end

M.on_attach = on_attach

local servers = { "rust_analyzer", "sumneko_lua", "gopls", "tsserver", "jsonls", "marksman", "elixirls" }
local capabilities = require "fenil.cmp".capabilities

local function setup_servers()
    require("mason").setup()

    mason_lspconfig.setup({
        ensure_installed = servers,
    })

    for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        lspconfig[server].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    -- server = {
                    --     -- path = "~/Projects/rust-projects/rust-analyzer/fix_completions/target/release/rust-analyzer",
                    -- },
                    -- trace = {
                    --     server = "verbose"
                    -- },
                    rustc = {
                        source = "discover",
                    }
                }

            }
        }
    end

    -- local has_rust_tools, rust_tools = pcall(require, "rust-tools")
    -- if has_rust_tools then
    --     rust_tools.setup({ server = {
    --         on_attach = on_attach,
    --         capabilities = capabilities,
    --     } })
    -- end
end

M.setup_servers = setup_servers()

setup_servers()

return M
