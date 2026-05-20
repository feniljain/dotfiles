local vim = vim

require("mason").setup()

local group = vim.api.nvim_create_augroup("LSP", { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    -- TODO: Give descriptions to all keymaps everywhere, to see ref checkout kickstart.nvim

    -- vim.lsp.log.set_level 'trace'

    group = group,
    callback = function(event)
        -- # Helper declarations
        local bufnr = event.buf
        -- local client = event.client
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        local map = function(keys, func)
            vim.keymap.set('n', keys, func, { noremap = true, silent = true, buf = bufnr })
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
        map('gtd', vim.lsp.buf.type_definition)
        map('gnr', vim.lsp.buf.rename)
        map('gr', vim.lsp.buf.references)
        map('gca', vim.lsp.buf.code_action)
        map('gth', vim.lsp.buf.typehierarchy)

        map('gsf', require("telescope.builtin").lsp_document_symbols)
        map('gsw', require("telescope.builtin").lsp_workspace_symbols)

        map("<leader>f", vim.lsp.buf.format)

        -- =======================================================================================

        -- Server based capabilities registration

        local protocol_methods = vim.lsp.protocol.Methods

        -- clean all existing autocmds
        vim.api.nvim_clear_autocmds({
            group = group,
            buf = bufnr,
        })

        -- Step 1: Registration

        -- =======================================================================================

        -- document highlighting
        if client and client:supports_method(protocol_methods.textDocument_documentHighlight) then
            vim.cmd [[
                hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
                hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
                hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            ]]

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                group = group,
                buf = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd('CursorMoved', {
                group = group,
                buf = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end

        -- codelens
        if client and client:supports_method(protocol_methods.textDocument_codeLens) then
            vim.lsp.codelens.enable(true, { bufnr = bufnr })
        end

        -- inlay hints
        if client and client:supports_method(protocol_methods.textDocument_inlayHint) then
            map('<Space>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end)
        end

        -- document color
        -- https://github.com/neovim/neovim/pull/33440/
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentColor) then
            vim.lsp.document_color.enable(true, bufnr)
        end

        -- Disable semantic highlighting
        -- https://github.com/mrcjkb/rustaceanvim/discussions/135
        -- https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end

        -- =======================================================================================

        -- Step 2: Clean detach

        -- detach server side registered capabilities
        vim.api.nvim_create_autocmd('LspDetach', {
            group = group,
            callback = function(event2)
                if client and client:supports_method(protocol_methods.textDocument_documentHighlight) then
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = group, buf = event2.buf }
                end

                if client and client:supports_method(protocol_methods.textDocument_codeLens) then
                    vim.lsp.codelens.enable(false, { bufnr = event2.buf })
                end

                if client and client:supports_method(protocol_methods.textDocument_documentColor) then
                    vim.lsp.document_color.enable(false, { bufnr = event2.buf })
                end
            end,
        })

        -- =======================================================================================
    end
}) 

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('taplo')
