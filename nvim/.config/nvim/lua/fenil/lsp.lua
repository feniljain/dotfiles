local M = {}

-- TODO: Give descriptions to all keymaps everywhere, to see ref checkout kickstart.nvim

local vim = vim

-- vim.lsp.set_log_level 'trace'

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require 'lspconfig'
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    local cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

        hint_enable = false, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",

        handler_opts = {
            border = "rounded",  -- double, rounded, single, shadow, none
        },
        decorator = { "`", "`" } -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help
    }

    require 'lsp_signature'.on_attach(cfg)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

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
    -- vim.keymap.set('n', 'gnr', '<cmd>Lspsaga rename<CR>', bufopts)
    vim.keymap.set('n', 'gnr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set({ 'n', 'v' }, 'gca', vim.lsp.buf.code_action, bufopts)

    vim.keymap.set('n', 'gwd', '<cmd>TroubleToggle workspace_diagnostics<CR>', bufopts)
    vim.keymap.set('n', 'gfd', '<cmd>TroubleToggle document_diagnostics<CR>', bufopts)
    vim.keymap.set('n', 'gqf', '<cmd>TroubleToggle quickfix<CR>', bufopts)

    vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']g', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', 'gsf', '<cmd>Telescope lsp_document_symbols<CR>', bufopts)
    vim.keymap.set('n', 'gsw', '<cmd>Telescope lsp_workspace_symbols<CR>', bufopts)
    vim.keymap.set('n', '<space>so', '<cmd>SymbolsOutline <CR>', bufopts) -- Not good enough as symbols-outline.nvim yet, check back in future.

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

    -- Disable semantic highlighting
    -- https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
    client.server_capabilities.semanticTokensProvider = nil

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
        virtual_lines = true, -- toggle lsp_lines.nvim functionality
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

local servers = { "luau_lsp", "gopls", "tsserver", "jsonls", "elixirls", "marksman" } -- "rust_analyzer", "clangd"
local capabilities = require "fenil.cmp".capabilities

local function setup_servers()
    -- vim.lsp.set_log_level('debug')
    require("mason").setup()

    mason_lspconfig.setup({
        ensure_installed = servers,
    })

    for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        lspconfig[server].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end

    lspconfig['rust_analyzer'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                -- server = {
                --     -- path = '/Users/feniljain/Projects/rust-projects/rust-analyzer/fix_enum_completion/target/release/rust-analyzer',
                --     -- path = '~/Projects/rust-projects/rust-analyzer/fix_enum_completion/target/release/rust-analyzer',
                -- },
                -- checkOnSave = {
                --     command = 'clippy',
                -- },
                checkOnSave = true,
                -- trace = {
                --     server = "verbose",
                --     extension = true,
                -- },
                rustc = {
                    source = "discover",
                },
            }

        }
    })

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
