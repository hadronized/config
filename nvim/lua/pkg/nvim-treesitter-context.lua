return {
  requires = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require'treesitter-context'.setup{
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 10, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = '─',
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>cc',
        cmd = 'TSContextToggle',
      }
    }
  }
}
