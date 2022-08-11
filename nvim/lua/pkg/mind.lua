return {
  config = function()
    require'mind'.setup {
      state_path = '~/mind/mind.json',
      data_dir = '~/mind/data',
      width = 40,
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
