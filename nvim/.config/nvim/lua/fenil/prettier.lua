local prettier = require("prettier")

prettier.setup({
    -- If you don't have prettierd installed, and try to use it, `null-ls` will just crash
    bin = 'prettier', -- or `'prettierd'` (v0.22+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        -- "json",
        "less",
        -- "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
    -- ["null-ls"] = {
    --     condition = function()
    --         return prettier.config_exists({
    --             -- if `true`, checks `package.json` for `"prettier"` key
    --             check_package_json = false,
    --         })
    --     end,
    --     timeout = 5000,
    -- }
})
