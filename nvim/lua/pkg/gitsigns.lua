return {
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- setup
    require'gitsigns'.setup {
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '▏', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '▏', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '▏', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      current_line_blame_opts = {
        virt_text_pos = 'eol',
        delay = 100,
      },
      current_line_blame_formatter = '   · <author>, <author_time:%R> | <summary> (<abbrev_sha>)',
    }
  end,
  keybindings = {
    v = {
      {
        key = '<leader>gs',
        lua = "require'gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})",
      },
      {
        key = '<leader>gx',
        lua = "require'gitsigns'.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})",
      },
    },
    n = {
      {
        key = '<leader>gbb',
        lua = "require'gitsigns'.blame_line()",
      },
      {
        key = '<leader>gbl',
        lua = "require'gitsigns'.toggle_current_line_blame()",
      },
      {
        key = '<leader>gd',
        lua = "require'gitsigns'.toggle_deleted()",
      },
      {
        key = '<leader>gh',
        lua = "require'gitsigns'.preview_hunk()",
      },
      {
        key = '<leader>gp',
        lua = "require'gitsigns.actions'.prev_hunk()",
      },
      {
        key = '<leader>gn',
        lua = "require'gitsigns.actions'.next_hunk()",
      },
      {
        key = '<leader>gs',
        lua = "require'gitsigns'.stage_hunk()",
      },
      {
        key = '<leader>gtl',
        lua = "require'gitsigns'.toggle_linehl()",
      },
      {
        key = '<leader>gu',
        lua = "require'gitsigns'.undo_stage_hunk()",
      },
      {
        key = '<leader>gx',
        lua = "require'gitsigns'.reset_hunk()",
      },
    }
  }
}
