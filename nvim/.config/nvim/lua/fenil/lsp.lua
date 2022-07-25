local M = {}

require('lspkind').init({})

local lsp_installer = require 'nvim-lsp-installer'
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
    vim.keymap.set('n', 'gpgd', '<cmd>Lspsaga preview_definition<CR>', bufopts)
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
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

    -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- -- Mappings.
    -- local opts = { noremap = true, silent = true }
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'gpgd', '<cmd>Lspsaga preview_definition<cr>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
    -- -- buf_set_keymap('n', 'wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- -- buf_set_keymap('n', 'wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- -- buf_set_keymap('n', 'wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- -- buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', 'gnr', '<cmd>Lspsaga rename<cr>', opts)
    -- -- buf_set_keymap('n', 'gca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    -- -- buf_set_keymap('n', 'gr', '<cmd> lsp_references<cr>', opts) buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', opts)
    -- -- buf_set_keymap('n', 'gca', '<cmd>Lspsaga code_action<cr>', opts)
    -- buf_set_keymap('n', 'gca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    -- buf_set_keymap('v', 'gca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    -- buf_set_keymap('n', 'gcra', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
    -- buf_set_keymap('v', 'gcra', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
    -- buf_set_keymap('n', 'gwd', '<cmd> workspace_diagnostics<cr>', opts)
    -- buf_set_keymap('n', 'gfd', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
    -- buf_set_keymap('n', 'gqf', '<cmd>Trouble quickfix<cr>', opts)
    -- buf_set_keymap('n', 'gsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', 'gpd', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', 'gnd', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', 'gll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', 'gsf', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    -- buf_set_keymap('n', 'gsw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    -- normal mode
    if client.resolved_capabilities.document_formatting then
        -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)
    end

    -- visual mode
    if client.resolved_capabilities.document_range_formatting then
        -- buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        vim.keymap.set('v', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', bufopts)
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
local servers = { "rust_analyzer", "sumneko_lua", "gopls", "tsserver", "eslint", "jsonls", "marksman" }
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
