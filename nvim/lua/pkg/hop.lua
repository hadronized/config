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
        cmd = 'HopWord',
      },
      {
        key = 'È',
        cmd = 'HopWordMW',
      },
      {
        key = '<leader>he',
        lua = "require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, hint_offset = 1})",
      },
      {
        key = '<leader>hE',
        lua = "require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, hint_offset = 1, mult_windows = true})",
      },
      {
        key = '<leader>hl',
        cmd = 'HopLineStart',
      },
      {
        key = '<leader>hL',
        cmd = 'HopLineStartMW',
      },
      {
        key = '<leader>hs',
        cmd = 'HopPattern',
      },
      {
        key = '<leader>hS',
        cmd = 'HopPatternMW',
      },
      {
        key = '<leader>hc',
        cmd = 'HopChar1',
      },
      {
        key = '<leader>hC',
        cmd = 'HopChar1MW',
      },
      {
        key = 'f',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })",
      },
      {
        key = 'F',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })",
      },
      {
        key = 'à',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })",
      },
      {
        key = 'À',
        lua = "require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })",
      },
    },
  }
}
