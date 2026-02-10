-- lua/config/completion.lua

vim.opt.completeopt = { "menuone", "noselect" }

require("mini.completion").setup({
  -- defaults are good; keep minimal
})

-- Use mini.completion's LSP completefunc when an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
  end,
})
