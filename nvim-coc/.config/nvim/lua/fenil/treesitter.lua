require('nvim-treesitter.configs').setup{
    ensure_installed = {"go", "rust", "c", "cpp", "lua", "typescript", "jsonc", "gomod", "html", "css", "dockerfile", "tsx", "comment", "toml", "javascript"},

    -- For nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true,
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true
    },
}
