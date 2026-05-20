-- setup all important plugins in particular order
require("fenil.plugins.treesitter")
require("fenil.plugins.telescope")
require("fenil.plugins.blink")
require("fenil.plugins.misc")

-- load all the needed keymaps after setting up all plugins
require("fenil.plugins.keymaps")
