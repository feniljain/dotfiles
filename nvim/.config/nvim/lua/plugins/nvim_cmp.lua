-- do not rename this to cmp.lua, cause that collides with what nvim-cmp
-- plugin exposes
local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "saadparwaiz1/cmp_luasnip",
        },
        {
            "hrsh7th/cmp-path",
        },
        {
            "hrsh7th/cmp-buffer",
        },
        {
            "andersevenrud/cmp-tmux",
        },
        {
            "hrsh7th/cmp-emoji",
        },
    },
}

M.config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ['<C-n>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-p>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<Tab>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping.abort(),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            -- { name = 'tmux' },
            { name = 'emoji' },
            { name = 'buffer',  keyword_length = 5 },
            -- { name = 'nvim_lsp_signature_help' }, -- Currently using lsp_signature instead
            { name = 'path' },
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                ellipsis_char = '...',
                show_labelDetails = true,
            }),
        },
        experimental = {
            ghost_text = true,
        },
        sorting = {
            -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,

                -- copied from cmp-under, but I don't think I need the plugin for this.
                -- I might add some more of my own.
                function(entry1, entry2)
                    local _, entry1_under = entry1.completion_item.label:find "^_+"
                    local _, entry2_under = entry2.completion_item.label:find "^_+"
                    entry1_under = entry1_under or 0
                    entry2_under = entry2_under or 0
                    if entry1_under > entry2_under then
                        return false
                    elseif entry1_under < entry2_under then
                        return true
                    end
                end,

                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
        completion = {
            completeopt = 'menu,menuone,noinsert'
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        }
    }

    require 'cmp'.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    M.capabilities = require('cmp_nvim_lsp').default_capabilities()
    M.cmp = cmp
end

return M
