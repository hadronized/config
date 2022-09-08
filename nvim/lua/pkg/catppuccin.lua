return {
  as = 'catppuccin',
  disable = true,
  init = function()
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  end,
  config = function()
    require'catppuccin'.setup {
      transparent_background = false,

      term_colors = false,

      compile = {
        enabled = false,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
      },

      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },

      integrations = {
        -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
      },

      color_overrides = {},

      highlight_overrides = {},
    }

    vim.cmd('colorscheme catppuccin')
  end
}
