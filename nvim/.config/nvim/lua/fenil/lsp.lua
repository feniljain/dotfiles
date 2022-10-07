local M = {}

require('lspkind').init({})

local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'
local util = require 'vim.lsp.util'

local formatting_callback = function(client, bufnr)
    vim.keymap.set('n', '<leader>f', function()
        local params = util.make_formatting_params({})
        client.request('textDocument/formatting', params, nil, bufnr)
    end, { buffer = bufnr })
end

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
    vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('v', 'gca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gcra', vim.lsp.buf.range_code_action, bufopts)
    vim.keymap.set('v', 'gcra', vim.lsp.buf.range_code_action, bufopts)

    vim.keymap.set('n', 'gwd', '<cmd>TroubleToggle workspace_diagnostics<CR>', bufopts)
    vim.keymap.set('n', 'gfd', '<cmd>TroubleToggle document_diagnostics<CR>', bufopts)
    vim.keymap.set('n', 'gqf', '<cmd>TroubleToggle quickfix<CR>', bufopts)
    vim.keymap.set('n', 'gsd', '<cmd>TroubleToggle show_line_diagnostics<CR>', bufopts)

    vim.keymap.set('n', 'g[', vim.lsp.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', 'g]', vim.lsp.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', 'gll', vim.lsp.diagnostic.set_loclist, bufopts)
    vim.keymap.set('n', 'gsf', vim.lsp.buf.document_symbol, bufopts)
    vim.keymap.set('n', 'gsw', vim.lsp.buf.workspace_symbol, bufopts)

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
    -- vim.keymap.set('n', '<space>so', '<cmd>LSoutlineToggle <CR>', bufopts) -- Not good enough as symbols-outline.nvim yet, check back in future

    -- if it is `tsserver`, use `null-ls` for formatting, as that is where
    -- prettier.nvim/eslint.nvim hooks up
    --
    -- if it is some other LSP, register normally
    --
    -- Taken from: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
    --
    -- Only needed for 0.7
    if client.name == "tsserver" then
        formatting_callback(client, bufnr)
    else
        -- Set some keybinds conditional on server capabilities
        -- normal mode
        if client.resolved_capabilities.document_formatting then
            -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
            vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)
        end

        -- visual mode
        if client.resolved_capabilities.document_range_formatting then
            -- buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
            vim.keymap.set('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', bufopts)
        end
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
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
        if filetype ~= "elm" then
            vim.cmd [[
           augroup lsp_document_codelens
             au! * <buffer>
             autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
             autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
           augroup END
         ]]
        end
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

-- rust_analyzer is handled by rust-tools.nvim
local servers = { "rust_analyzer", "sumneko_lua", "gopls", "tsserver", "jsonls", "marksman" }
local capabilities = require "fenil.cmp".capabilities

local function setup_servers()

    lsp_installer.setup({
        ensure_installed = servers,
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    })

    for _, server in ipairs(lsp_installer.get_installed_servers()) do
        lspconfig[server.name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end

    local has_rust_tools, rust_tools = pcall(require, "rust-tools")
    if has_rust_tools then
        rust_tools.setup({ server = {
            on_attach = on_attach,
            capabilities = capabilities,
        } })
    end
end

setup_servers()

return M

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-- local sumneko_root_path = '/home/feniljain/Projects/softwares/lua-language-server'
-- local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

-- nvim_lsp.clangd.setup {
--     on_attach = on_attach,
--     root_dir = function() return vim.loop.cwd() end
-- }
--

-- nvim_lsp.sumneko_lua.setup {
--    on_attach = on_attach,
--     cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--                 -- Setup your lua path
--                 path = vim.split(package.path, ';'),
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {'vim'},
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = {
--                     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                     [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--                     [vim.fn.expand('~/.local/share/nvim/plugged/telescope.nvim')] = true,
--                     [vim.fn.expand('~/.local/share/nvim/plugged/plenary.nvim')] = true,
--                     [vim.fn.expand('~/.local/share/nvim/plugged/harpoon')] = true,
--                     [vim.fn.expand('~/.local/share/nvim/plugged/popup.nvim')] = true,
--                 },
--             },
--         },
--     },
-- }
--
