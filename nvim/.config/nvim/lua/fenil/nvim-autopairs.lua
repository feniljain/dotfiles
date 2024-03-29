-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')
--
--
-- require("nvim-autopairs.completion.compe").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true, -- it will auto insert `(` after select function or method item
--   auto_select = false,  -- auto select first item
-- })
--
-- npairs.setup{}
--
-- -- npairs.add_rule(Rule("$$","$$","tex"))
-- npairs.add_rule(Rule("<", ">", {"rust", "js", "ts", "html", "go", "dart", "c", "cpp"}))
-- npairs.add_rule(Rule("{", "}", {"rust", "js", "ts", "html", "go", "dart", "c", "cpp"}))

require("nvim-autopairs").setup {}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require 'fenil.cmp'.cmp

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
