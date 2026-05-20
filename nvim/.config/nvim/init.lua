--  |  ____|       (_) |      | |     (_)
--  | |__ ___ _ __  _| |      | | __ _ _ _ __
--  |  __/ _ \ '_ \| | |  _   | |/ _` | | '_ \
--  | | |  __/ | | | | | | |__| | (_| | | | | |
--  |_|  \___|_| |_|_|_|  \____/ \__,_|_|_| |_|
--
--  Author: fkjainco@gmail.com
--  File: init.lua (Neovim configuration)

-- print(">^.^< Hello, fenil!")

-- Found it here: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack.html#lazy.nvim,
-- claims to speed up startup times!
--
-- My current config went from ~170s to ~145s. But this is consistent after
-- a few runs. To measure: `nvim --startuptime startuptime.log` and look for
-- "--- NVIM STARTED ---" line at the very end, timing at the start of the this
-- log is your startup time :)
--
-- Not sure if I was using lazy vim correctly but my startup time was ~175s even
-- then 🫠
--
-- NOTE: This needs to be the very first statement execution in the config.
vim.loader.enable()

require("fenil")
