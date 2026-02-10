vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
map('n', '<leader>w', '<cmd>write<cr>', { desc = "Save" })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = "Quit" })

-- mini.pick (fuzzy finder)
local pick = require("mini.pick")

map("n", "<leader>ff", function() pick.builtin.files() end, { desc = "Find files" })
map("n", "<leader>fg", function() pick.builtin.grep_live() end, { desc = "Live grep" })
map("n", "<leader>fb", function() pick.builtin.buffers() end, { desc = "Buffers" })
map("n", "<leader>fh", function() pick.builtin.help() end, { desc = "Help tags" })

map("n", "<leader>tf", function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  print("autoformat: " .. (vim.b.disable_autoformat and "off" or "on"))
end, { desc = "Toggle format on save (buffer)" })

map("n", "<leader>F", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format now" })
local oil = require("oil")

local function cur_dir()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then return vim.fn.getcwd() end
  return vim.fn.fnamemodify(name, ":p:h")
end

map("n", "<leader>e", function() oil.toggle_float(cur_dir()) end, { desc = "Oil (float)" })
map("n", "-", function() oil.open(cur_dir()) end, { desc = "Oil (dir)" })

map("n", "<leader>nn", function()
  vim.cmd("botright 12split")
  MiniNotify.show_history()
end, { desc = "Notifications: history (split)" })

map("n", "<leader>nc", function() MiniNotify.clear() end, { desc = "Notifications: clear active" })

-- Diagnostics
map("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
end, { desc = "Diagnostics: line (float)" })

map("n", "<leader>dl", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostics: location list" })
