-- This is not set in `sets.vim` cause for some reason
-- when set there, `:e` does not cause any treesitter
-- fold refreshes, and once unfolded or externally
-- pasted text is introduced, it used to never re-fold
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldmethod = 'expr'
