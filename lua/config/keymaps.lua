vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
map('n', '<leader>w', '<cmd>write<cr>', { desc = "Save" })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = "Quit" })

map("n", "<leader>ff", function() pick.builtin.files() end, { desc = "Find files" })
map("n", "<leader>fg", function() pick.builtin.grep_live() end, { desc = "Live grep" })
map("n", "<leader>fb", function() pick.builtin.buffers() end, { desc = "Buffers" })
map("n", "<leader>fh", function() pick.builtin.help() end, { desc = "Help tags" })
