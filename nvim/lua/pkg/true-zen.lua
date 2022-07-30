return {
  config = function()
    require'true-zen'.setup {}
  end,
  keybindings = {
    ['n'] = {
      {
        key = "<leader>wz",
        cmd = "TZFocus",
      }
    }
  },
}
