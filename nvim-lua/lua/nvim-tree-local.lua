local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  -- default mappings
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("cd"),
  ["<C-v>"]          = tree_cb("vsplit"),
  ["<C-o>"]          = tree_cb("split"),
  ["<C-t>"]          = tree_cb("tabnew"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["."]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["y"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["c"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
