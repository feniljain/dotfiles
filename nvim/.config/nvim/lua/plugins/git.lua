return {
    -- {
        -- "NeogitOrg/neogit", -- Crashes for local setup rn :(
        -- config = true,
    -- },
    {
        "tpope/vim-fugitive",
    },
    {
        "sindrets/diffview.nvim",
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    {
        "feniljain/git-worktree.nvim",
        branch = "fixes",
    },
}
