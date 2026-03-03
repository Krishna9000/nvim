vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

keymap("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "Find files" })

keymap("n", "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "Live grep" })

keymap("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Buffers" })

keymap("n", "<leader>fh", function()
  require("fzf-lua").help_tags()
end, { desc = "Help tags" })

keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
keymap("n", "<leader>of", "<cmd>Oil --float<cr>", { desc = "Oil float" })
