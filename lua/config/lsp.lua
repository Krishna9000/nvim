vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    pcall(vim.lsp.completion.enable, true, client.id, bufnr)

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map({ "n", "v" }, "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")

    map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

    if client and client.supports_method and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim",
          "MiniStatusline",
          "MiniNotify",
          "MiniCompletion",
          "MiniPick",
          "MiniFiles",
        }
      },
      workspace = { checkThirdParty = false },
    },
  },
})

-- Rust
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = true,
    },
  },
})

-- TypeScript / JavaScript (includes React: tsx/jsx)
-- NOTE: in modern nvim-lspconfig this is `ts_ls` (not `tsserver`).
vim.lsp.config("ts_ls", {})

-- HTML / CSS
vim.lsp.config("html", {})
vim.lsp.config("cssls", {})

-- TOML
vim.lsp.config("taplo", {})

-- Java
vim.lsp.config("jdtls", {})

-- enable everything
vim.lsp.enable({
  "lua_ls",
  "jdtls",
  "rust_analyzer",
  "ts_ls",
  "html",
  "cssls",
  "taplo",
})

-- Swift (SourceKit-LSP)
vim.lsp.config("sourcekit", {
  -- On macOS, xcrun reliably finds the toolchain copy.
  cmd = { "xcrun", "sourcekit-lsp" },
})

vim.lsp.enable("sourcekit")
