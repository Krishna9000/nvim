-- lua/config/progress.lua
local M = {}

local frames = { "|", "/", "-", "\\" }
local idx = 1

-- Called by statusline
function M.lsp()
  local ok, msg = pcall(vim.lsp.status) -- aggregate LSP progress text :contentReference[oaicite:1]{index=1}
  if not ok or not msg or msg == "" then return "" end
  return frames[idx] .. " " .. msg
end

-- Advance spinner + redraw when LSP progress arrives :contentReference[oaicite:2]{index=2}
vim.api.nvim_create_autocmd("LspProgress", {
  callback = function()
    idx = (idx % #frames) + 1
    vim.cmd("redrawstatus")
  end,
})

return M
