local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return
end

gitsigns.setup({
  signs_staged_enable = false,
  current_line_blame = false,
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  attach_to_untracked = false,

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "]h", gs.next_hunk, "Next hunk")
    map("n", "[h", gs.prev_hunk, "Prev hunk")
    map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
    map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>hb", gs.blame_line, "Blame line")
  end,
})
