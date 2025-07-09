local map = function(keys, func)
    vim.keymap.set('n', keys, func, { noremap = true, silent = true, buffer = bufnr })
end

toggle_qf = function()
  -- print("toggle_qf::start")
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

map('<C-q>', toggle_qf)
