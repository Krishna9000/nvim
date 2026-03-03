local ok, oil = pcall(require, "oil")
if not ok then
  return
end

oil.setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  delete_to_trash = false,
  skip_confirm_for_simple_edits = true,
  constrain_cursor = "editable",
  watch_for_changes = false,
  view_options = {
    show_hidden = false,
  },
  float = {
    padding = 2,
    max_width = 90,
    max_height = 0,
    border = "rounded",
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-s>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["<BS>"] = "actions.parent",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["q"] = "actions.close",
  },
})
