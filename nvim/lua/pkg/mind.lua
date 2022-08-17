return {
  branch = 'v2',
  requires = { 's1n7ax/nvim-window-picker' },
  config = function()
    require'mind'.setup {
      persistence = {
        state_path = '~/mind/mind.json',
        data_dir = '~/mind/data',
      },

      ui = {
        width = 40,
      },
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>mm',
        cmd = 'MindOpenMain',
      },
      {
        key = '<leader>mp',
        cmd = 'MindOpenProject',
      },
      {
        key = '<leader>mr',
        cmd = 'MindReloadState',
      },
    }
  }
}
