local lang_parsers_to_install = { "go", "rust", "cpp", "typescript", "gomod", "html", "css", "dockerfile", "tsx", "comment", "javascript", "toml", "java" }

require('nvim-treesitter').install(lang_parsers_to_install):wait(300000) -- wait max. 5 minutes
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter-lang-setup', { clear = true }),
    pattern = lang_parsers_to_install,
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()

        -- folds, provided by Neovim
        -- This is not set in `sets.vim` cause for some reason
        -- when set there, `:e` does not cause any treesitter
        -- fold refreshes, and once unfolded or externally
        -- pasted text is introduced, it used to never re-fold
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'

        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
