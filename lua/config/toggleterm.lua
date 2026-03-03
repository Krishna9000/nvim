local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup({
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = false,
  persist_mode = false,
  close_on_exit = false,
  auto_scroll = true,
  direction = "float",

  size = function(term)
    if term.direction == "horizontal" then
      return math.floor(vim.o.lines * 0.30)
    elseif term.direction == "vertical" then
      return math.floor(vim.o.columns * 0.40)
    end
  end,

  float_opts = {
    border = "rounded",
    width = function()
      return math.floor(vim.o.columns * 0.90)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.85)
    end,
  },
})

local Terminal = require("toggleterm.terminal").Terminal

_G.float_term = Terminal:new({
  direction = "float",
  hidden = true,
})

_G.log_term = Terminal:new({
  direction = "horizontal",
  hidden = true,
  size = 15,
})
