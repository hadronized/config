return {
  requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
  config = function()
    require'neogit'.setup {
      disable_builtin_notifications = true,

      integrations = {
        diffview = true,
      }
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>gg',
        cmd = 'Neogit',
      },
    }
  }
}
