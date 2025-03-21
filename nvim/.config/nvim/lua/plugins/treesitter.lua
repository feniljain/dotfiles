return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "romgrk/nvim-treesitter-context",
            config = true,
        },
    },

    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "go", "rust", "cpp", "typescript", "jsonc", "gomod", "html", "css", "dockerfile",
                "tsx", "comment", "vim", "markdown", "javascript", "toml", "java" },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = true },

            markid = { enable = true }
        }
    end
}
