local gh = function(repo) return "https://github.com/" .. repo end

vim.pack.add({
  gh("echasnovski/mini.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("stevearc/oil.nvim"),
})
