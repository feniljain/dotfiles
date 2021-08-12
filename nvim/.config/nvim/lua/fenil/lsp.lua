require('lspkind').init({})

-- TODO: Get nvim-compe to complete brackets too, ref: https://www.reddit.com/r/neovim/comments/o4uuhg/nvimlspnvimcompe_auto_add_parentheses_when/

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)

  local cfg = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
                   -- If you want to hook lspsaga or other signature handler, pls set to false
      doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

      hint_enable = false, -- virtual hint enable
      hint_prefix = "🐼 ",  -- Panda for parameter
      hint_scheme = "String",

      handler_opts = {
        border = "shadow"   -- double, single, shadow, none
      },
      decorator = {"`", "`"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help
  }

  require'lsp_signature'.on_attach(cfg)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gpgd', '<cmd>Lspsaga preview_definition<cr>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
  -- buf_set_keymap('n', 'wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', 'wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', 'wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gnr', '<cmd>Lspsaga rename<cr>', opts)
  -- buf_set_keymap('n', 'gca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>LspTrouble lsp_references<cr>', opts) buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', opts)
  -- buf_set_keymap('n', 'gca', '<cmd>Lspsaga code_action<cr>', opts)
  buf_set_keymap('n', 'gca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('v', 'gca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('n', 'gcra', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
  buf_set_keymap('v', 'gcra', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
  buf_set_keymap('n', 'gwd', '<cmd>LspTrouble lsp_workspace_diagnostics<cr>', opts)
  buf_set_keymap('n', 'gfd', '<cmd>LspTrouble lsp_document_diagnostics<cr>', opts)
  buf_set_keymap('n', 'gqf', '<cmd>LspTrouble quickfix<cr>', opts)
  buf_set_keymap('n', 'gsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gpd', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'gnd', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', 'gsf', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gsw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

end

local sumneko_root_path = '/home/feniljain/Projects/softwares/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

-- nvim_lsp.tsserver.setup{ on_attach=on_attach }
-- nvim_lsp.clangd.setup {
--     on_attach = on_attach,
--     root_dir = function() return vim.loop.cwd() end
-- }
--
-- require'lspconfig'.pyls.setup{ on_attach=on_attach }
-- require'lspconfig'.gopls.setup{ on_attach=on_attach }
-- require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }

nvim_lsp.sumneko_lua.setup {
   on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    [vim.fn.expand('~/.local/share/nvim/plugged/telescope.nvim')] = true,
                    [vim.fn.expand('~/.local/share/nvim/plugged/plenary.nvim')] = true,
                    [vim.fn.expand('~/.local/share/nvim/plugged/harpoon')] = true,
                    [vim.fn.expand('~/.local/share/nvim/plugged/popup.nvim')] = true,
                },
            },
        },
    },
}

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    -- print(server)
    -- if server == "rust" then
    --     require'lspconfig'[server].setup{
    --             settings = {
    --                 ["rust-analyzer"] = {
    --                     procMacro = {
    --                         enable = true
    --                     },
    --                     checkOnSave = {
    --                         command = "clippy"
    --                     },
    --                 },
    --             },
    --         on_attach=on_attach,
    --     }
    --     return
    -- end
    require'lspconfig'[server].setup{ on_attach = on_attach }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
