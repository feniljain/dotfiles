local M = {
    "williamboman/mason.nvim",
    dependencies = {
        {
            "neovim/nvim-lspconfig",
        },
        {
            "williamboman/mason-lspconfig.nvim",
        },
        {
            "ray-x/lsp_signature.nvim",
            config = true,
        },
        {
            "onsails/lspkind.nvim",
        },
        {
            "David-Kunz/markid",
        },
        {
            "SmiteshP/nvim-navic",
            config = true,
        },
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load() -- required for this plugin to work
                    end
                },
            },
            config = true,
        },
        {
            "folke/trouble.nvim",
            cmd = "Trouble",
            keys = {
                {
                    "gwd",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Diagnostics (Trouble)",
                },
                {
                    "gfd",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
            },
            config = true,
        },
    },
}

local vim = vim

M.config = function()
    -- TODO: Give descriptions to all keymaps everywhere, to see ref checkout kickstart.nvim

    -- vim.lsp.set_log_level 'trace'

    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require 'lspconfig'
    local navic = require("nvim-navic")

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach-u-la-la', { clear = true }),
        callback = function(event)
            -- # Helper declarations
            local bufnr = event.buf
            local client = event.client

            local map = function(keys, func)
                vim.keymap.set('n', keys, func, { noremap = true, silent = true, buffer = bufnr })
            end

            -- Done by default since 0.10.0
            -- Enable completion triggered by <c-x><c-o>
            -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- `K` hover is a default keymap since 0.10.0
            -- ]d for next diagnostic
            -- [d for previous diagnostic

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions

            map('gD', vim.lsp.buf.declaration)
            map('gd', vim.lsp.buf.definition)
            map('K', vim.lsp.buf.hover)
            map('gi', vim.lsp.buf.implementation)
            map('gK', vim.lsp.buf.signature_help)
            map('gtd', vim.lsp.buf.type_definition)
            map('gnr', vim.lsp.buf.rename)
            map('gr', vim.lsp.buf.references)
            map('gca', vim.lsp.buf.code_action)
            map('gth', vim.lsp.buf.typehierarchy)

            map('gsf', require("telescope.builtin").lsp_document_symbols)
            map('gsw', require("telescope.builtin").lsp_workspace_symbols)

            -- # Server based capabilities registration

            -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_formatting) then
            -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            map("<leader>f", vim.lsp.buf.format)
            -- end

            -- Set autocommands conditional on server_capabilities
            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                local highlight_group_name = "lsp-highlight-u-la-la"
                vim.cmd [[
                    hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
                    hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
                    hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
                ]]

                vim.api.nvim_create_augroup(highlight_group_name, {
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

                vim.api.nvim_create_autocmd('LspDetach', {
                    group = vim.api.nvim_create_augroup('lsp-detach-u-la-la', { clear = true }),
                    callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds { group = highlight_group_name, buffer = event2.buf }
                    end,
                })
            end

            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_codeLens) then
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
            -- client.server_capabilities.semanticTokensProvider = nil

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = true,
                severity_sort = false,
                virtual_lines = true, -- toggle lsp_lines.nvim functionality
                float = {
                    header = false,
                    border = 'rounded',
                    focusable = true,
                },
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

            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                map('<Space>th', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                end)
            end

            -- # Plugin specific registration

            local lsp_sig_cfg = {
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

            require 'lsp_signature'.on_attach(lsp_sig_cfg)

            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentSymbol) then
                navic.attach(client, bufnr)
            end
        end
    })

    local servers = { "gopls", "tsserver", "jsonls", "marksman" } -- "rust_analyzer", "clangd"
    local capabilities = require "plugins.nvim_cmp".capabilities

    local function setup_servers()
        -- vim.lsp.set_log_level('debug')
        require("mason").setup()

        mason_lspconfig.setup({
            ensure_installed = servers,
        })

        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
            lspconfig[server].setup {
                capabilities = capabilities,
            }
        end

        lspconfig['rust_analyzer'].setup({
            capabilities = capabilities,
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
    end

    setup_servers()
end

-- # Borders: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- #

return M
