return {
  as = 'nvim-tree',
  init = function()
    vim.g.nvim_tree_side = 'left'
    vim.g.nvim_tree_width = 40
    vim.g.nvim_tree_allow_resize = 1
  end,
  config = function()
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback

    require'nvim-tree'.setup {
      update_focused_file = {
        enable = true,
      },
      view = {
        mappings = {
          custom_only = true,
          list = {
            -- default mappings
            { key = { "<CR>", "<TAB>" },   cb = tree_cb("edit") },
            { key = { "o" },      cb = tree_cb("cd") },
            { key = { "<C-v>" },  cb = tree_cb("vsplit") },
            { key = { "<C-o>" },  cb = tree_cb("split") },
            { key = { "<C-t>" },  cb = tree_cb("tabnew") },
            { key = { "<BS>" },   cb = tree_cb("close_node") },
            { key = { "<S-CR>" }, cb = tree_cb("close_node") },
            { key = { "<Tab>" },  cb = tree_cb("preview") },
            { key = { "I" },      cb = tree_cb("toggle_ignored") },
            { key = { "." },      cb = tree_cb("toggle_dotfiles") },
            { key = { "R" },      cb = tree_cb("refresh") },
            { key = { "a" },      cb = tree_cb("create") },
            { key = { "d" },      cb = tree_cb("remove") },
            { key = { "r" },      cb = tree_cb("rename") },
            { key = { "<C-r>" },  cb = tree_cb("full_rename") },
            { key = { "x" },      cb = tree_cb("cut") },
            { key = { "y" },      cb = tree_cb("copy") },
            { key = { "p" },      cb = tree_cb("paste") },
            { key = { "c" },      cb = tree_cb("dir_up") },
            { key = { "q" },      cb = tree_cb("close") },
          },
        }
      }
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>ft',
        cmd = 'NvimTreeToggle',
      },
    }

  }
}
