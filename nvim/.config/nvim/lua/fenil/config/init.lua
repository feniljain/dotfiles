-- always run package manager stuff before everything
require("fenil.config.prepack")
require("fenil.config.pack")

-- next lets run all the sets
require("fenil.config.sets")

 -- load theme as the first thing next in the stack
require("fenil.config.theme")
require("fenil.config.autocmds")
require("fenil.config.keymaps")
require("fenil.config.functions")
require("fenil.config.diagnostic")
require("fenil.config.lsp")
require("fenil.config.misc")
