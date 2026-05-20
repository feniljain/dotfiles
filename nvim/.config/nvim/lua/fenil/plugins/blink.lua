require('blink.cmp').setup({
    sources = {
        default = {
            "lsp", -- X
            "buffer", -- X
            "snippets", -- X
            "path",
        },
    },
    signature = { 
        enabled = true,
        window = {
            show_documentation = false,
        },
    },
    cmdline = { enabled = false },
    completion = {
        list = {
            selection = {
                preselect = true, -- X
                auto_insert = true, -- X
            },
        },
        accept = {
            auto_brackets = { enabled = true },
        },
        ghost_text = {
            enabled = true,
            show_with_menu = false,
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            treesitter_highlighting = false,
        },
        trigger = {
            show_on_trigger_character = true,
            show_on_keyword = false,
            show_on_insert_on_trigger_character = true,
        },
        menu = {
            auto_show = false, -- X
            border = "rounded", -- X
        },
    },
    keymap = {
        ['<CR>'] = { 'accept', 'fallback' }, -- X
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
})
