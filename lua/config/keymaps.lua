vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })
keymap("i", "<leader>jj", "<esc>", { desc = "Normal Mode" })
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

-- Window splits
keymap("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
keymap("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontal" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })

-- Window navigation
keymap("n", "<leader>th", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<leader>tj", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<leader>tk", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<leader>tl", "<C-w>l", { desc = "Go to right window" })

-- Window resize
keymap("n", "<leader><left>", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
keymap("n", "<leader><right>", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })
keymap("n", "<leader><up>", "<cmd>resize +2<cr>", { desc = "Resize up" })
keymap("n", "<leader><down>", "<cmd>resize -2<cr>", { desc = "Resize down" })

-- Tabs
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
keymap("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next tab" })
keymap("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
