require'nvim-treesitter.configs'.setup({
  highlight = {
    enable = true,              -- false will disable the whole extension
  },

  indent = {
    enabled = false,
  },

  textobjects = {
    enabled = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
