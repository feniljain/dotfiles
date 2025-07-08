-- To show search index when cmdheight=0
-- https://www.reddit.com/r/neovim/comments/12o6tk5/search_index/

M = {}

-- local search_count_extmark_id
-- M.show_search_index = function()
-- 	local namespaceId = vim.api.nvim_create_namespace("search")
-- 	vim.api.nvim_buf_clear_namespace(0, namespaceId, 0, -1)
-- 	local searchCount = vim.fn.searchcount()
-- 	search_count_extmark_id = vim.api.nvim_buf_set_extmark(0, namespaceId, vim.api.nvim_win_get_cursor(0)[1] - 1, 0, {
-- 		virt_text = { { "[" .. searchCount.current .. "/" .. searchCount.total .. "]", "StatusLine" } },
-- 		virt_text_pos = "eol",
-- 	})
--
-- 	vim.cmd("redraw")
-- end
--
-- M.clear_search_index = function()
-- 	local namespaceId = vim.api.nvim_get_namespaces()["search"]
-- 	vim.api.nvim_buf_del_extmark(0, namespaceId, search_count_extmark_id)
-- end
--
-- -- these keys should work as they normally do, but additionally
-- -- we want to trigger show_search_index with them
-- local keys = { "n", "N", "*", "#", "g*", "g#" }
-- for _, key in ipairs(keys) do
-- 	vim.keymap.set("n", key, function()
-- 		vim.cmd("normal! " .. key)
-- 		M.show_search_index()
-- 	end, { noremap = true })
-- end
--
-- vim.keymap.set("n", "<Esc>", function()
-- 	M.clear_search_index()
-- end)
--
-- local group = vim.api.nvim_create_augroup("SearchIndex", { clear = true })
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
-- 	group = group,
-- 	callback = function(event)
-- 		-- for some reason "pattern" doesn't work when adding "?"
-- 		if event.match == "/" or event.match == "?" then
-- 			M.show_search_index()
-- 		end
-- 	end,
-- })

return M
