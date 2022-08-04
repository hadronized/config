return {
  config = function()
    require'mind'.setup {}
    require'mind2'.setup {
      state_path = '~/mind/mind.json',
      data_dir = '~/mind/data',
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>nn',
        lua = "require'mind'.open_note()",
      },
      {
        key = '<leader>nN',
        lua = "require'mind'.new_note()",
      },
      {
        key = '<leader>nt',
        lua = "require'mind'.open_todo()",
      },
      {
        key = '<leader>nT',
        lua = "require'mind'.new_todo()",
      },
      {
        key = '<leader>ns',
        lua = "require'mind'.open_wip()",
      },
      {
        key = '<leader>nS',
        lua = "require'mind'.new_wip()",
      },
      {
        key = '<leader>nd',
        lua = "require'mind'.open_done()",
      },
      {
        key = '<leader>nD',
        lua = "require'mind'.new_done()",
      },
      {
        key = '<leader>nj',
        lua = "require'mind'.open_daily()",
      },
      {
        key = '<leader>nJ',
        lua = "require'mind'.open_journal()",
      },
      {
        key = '<leader>n$t',
        lua = "require'mind'.mark_todo()",
      },
      {
        key = '<leader>n$s',
        lua = "require'mind'.mark_wip()",
      },
      {
        key = '<leader>n$d',
        lua = "require'mind'.mark_done()",
      },

      -- mind2
      {
        key = '<leader>mm',
        lua = "require'mind2'.open_main()",
      },
      {
        key = '<leader>mp',
        lua = "require'mind2'.open_project()",
      },
      {
        key = '<leader>mr',
        lua = "require'mind2'.load_state()",
      },
    }
  }
}
