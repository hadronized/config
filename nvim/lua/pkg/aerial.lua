return {
  config = function()
    require'aerial'.setup {
      layout = {
        default_direction = 'prefer_right',
      },

      highlight_on_hover = true,
      manage_folds = true,
      placement = 'edge',
      show_guides = true,
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>co';
        cmd = 'AerialToggle'
      }
    }
  }
}
