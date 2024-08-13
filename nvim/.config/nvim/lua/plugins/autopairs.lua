return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        -- do not remove this setup function, it is needed for this plugin to work
        require('nvim-autopairs').setup({})

        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
