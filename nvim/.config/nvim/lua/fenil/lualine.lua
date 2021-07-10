-- local function lsp_info()
--     local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
--     local errors = vim.lsp.diagnostic.get_count(0, "Error")
--     local hints = vim.lsp.diagnostic.get_count(0, "Hint")
--
--     return string.format("LSP: H %d W %d E %d", hints, warnings, errors)
-- end
--
-- local function play()
--     local str = ""
--     print(ipairs(require'lsp-status'.messages()))
--     local i = 0
--     for k, _ in ipairs(require'lsp-status'.messages()) do
--         print(i)
--         -- print(k)
--         str = str..k
--         i = i+1
--     end
--
--     return str
-- end

local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- local lspconfig = require('lspconfig')

-- Some arbitrary servers
-- lspconfig.clangd.setup({
--   handlers = lsp_status.extensions.clangd.setup(),
--   init_options = {
--     clangdFileStatus = true
--   },
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })
--
-- lspconfig.pyls_ms.setup({
--   handlers = lsp_status.extensions.pyls_ms.setup(),
--   settings = { python = { workspaceSymbols = { enabled = true }}},
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })
--
-- lspconfig.ghcide.setup({
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })
-- lspconfig.rust_analyzer.setup({
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })

-- local messages = require'lsp-status'.messages()

require('lualine').setup{
  options = {
    theme = 'seoul256',
    -- theme = 'gruvbox-flat',
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {
            'filename',
            color = {fg = '#ffffff'},
            file_status = true,
        },
        {
          'diagnostics',
          sources = {'nvim_lsp'},
          sections = {
              'error',
              'warn',
              'info'
          },
          symbols = {
              warn = ' ',
              error = ' ',
              info = ' ',
          },
          color_error = '#ff0000',
          color_warn = '#ffaa00',
          color_info = '#ffffff',
        },
    },
    lualine_x = { require'lsp-status'.status, 'encoding', 'fileformat', 'filetype' },
    -- lualine_x = { play, 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  },
  extensions = { 'fugitive' }
}
