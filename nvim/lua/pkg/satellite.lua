return {
  config = function()
    require('satellite').setup {
      current_only = false,
      winblend = 10,
      zindex = 40,
      excluded_filetypes = {},
      width = 2,
      handlers = {
        search = {
          enable = true,
        },
        diagnostic = {
          enable = true,
        },
        gitsigns = {
          enable = true,
        },
        marks = {
          enable = true,
          show_builtins = false, -- shows the builtin marks like [ ] < >
        },
      },
    }

    vim.api.nvim_set_hl(0, 'ScrollView', { link = 'PmenuSel' })
  end
}
