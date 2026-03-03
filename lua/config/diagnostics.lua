vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
})
