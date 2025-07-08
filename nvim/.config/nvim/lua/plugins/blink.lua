return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "moyiz/blink-emoji.nvim",
        },
        version = '1.*',
        event = "InsertEnter",
        opts = {
            sources = {
                default = {
                    "emoji",
                    "lsp",
                    "buffer",
                    "snippets",
                    "path",
                },
                providers = {
                    emoji = {
                        module = "blink-emoji",
                        name = "Emoji",
                        score_offset = 15,
                        opts = {
                            insert = true,
                            trigger = function()
                                return { ":" }
                            end,
                        },
                    },
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
                        preselect = true,
                        auto_insert = true,
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
                    auto_show = false,
                    border = "rounded",
                },
            },
            keymap = {
                ['<CR>'] = { 'accept', 'fallback' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
    },
}
