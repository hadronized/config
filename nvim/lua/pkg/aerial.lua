return {
  config = function()
    require'aerial'.setup {
      default_direction = 'prefer_right',
      highlight_on_hover = true,
      manage_folds = true,
      placement_editor_edge = true,
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
