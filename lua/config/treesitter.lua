local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  return
end

ts.install({
  "rust",
  "lua",
  "vim",
  "vimdoc",
  "markdown",
  "markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "rust",
    "lua",
    "vim",
    "markdown",
  },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
