require('nvim-treesitter.configs').setup {
    ensure_installed = { "go", "rust", "c", "cpp", "lua", "typescript", "jsonc", "gomod", "html", "css", "dockerfile",
        "tsx", "comment", "vim", "markdown", "elixir", "javascript", "nix", "toml" },

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

require 'treesitter-context'.setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
}
