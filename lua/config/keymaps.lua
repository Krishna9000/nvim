vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
map('n', '<leader>w', '<cmd>write<cr>', { desc = "Save" })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = "Quit" })

local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Find Old Files" })
map("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Current Buffer Fuzzy Find" })

map("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Oil" })
map("n", "<leader>o", function() 
  require("oil").open_float()
end, {})
