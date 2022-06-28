return {
  config = function()
    require("snippy").setup {
      snippet_dirs = '~/.config/nvim/snippets',
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
      },
    }
  end
}
