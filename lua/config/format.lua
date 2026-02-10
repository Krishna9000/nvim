-- lua/config/format.lua
-- Format on save, only when an attached LSP client supports formatting.

local augroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function(args)
    -- Allow per-buffer opt-out
    if vim.b[args.buf].disable_autoformat then return end

    -- Only format if any attached LSP can format this buffer
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    for _, c in ipairs(clients) do
      if c.supports_method and c:supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 2000 })
        return
      end
    end
  end,
})
