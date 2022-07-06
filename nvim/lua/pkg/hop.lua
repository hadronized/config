return {
  branch = 'v2',
  config = function()
    require'hop'.setup {
      keys = 'etovxqpdygfblzhckisuran',
    }
  end,
  keybindings = {
    [''] = {
      {
        key = 'è',
        cmd = 'HopWord'
      },
      {
        key = 'È',
        cmd = 'HopChar1'
      },
      {
        key = '<C-l>',
        cmd = 'HopLineStart'
      },
      {
        key = '<leader>/',
        cmd = 'HopPattern'
      },
      {
        key = '<C-e>',
        cmd = 'HopWordMW'
      },
      {
        key = 'f',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })"
      },
      {
        key = 'F',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })"
      },
      {
        key = 'à',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })"
      },
      {
        key = 'À',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })"
      },
    },
  }
}
