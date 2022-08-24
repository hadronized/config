return {
  disable = true,
  branch = 'v2.x',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    {
      -- only needed if you want to use the commands with '_with_window_picker' suffix
      's1n7ax/nvim-window-picker',
      tag = 'v1.*',
      config = function()
        require'window-picker'.setup({
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix' },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal' },
            },
          },
          other_win_hl_color = '#e35e4f',
        })
      end,
    }
  },
  config = function()
    require'neo-tree'.setup {
      sources = {
        'filesystem',
        'buffers',
        'git_status',
        'diagnostics',
      },

      diagnostics = {
        bind_to_cwd = true,
        diag_sort_function = 'severity', -- 'severity' means diagnostic items are sorted by severity in addition to their positions.
        -- 'position' means diagnostic items are sorted strictly by their positions.
        -- May also be a function.
        follow_behavior = { -- Behavior when `follow_current_file` is true
          always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file.
          expand_followed = true, -- Ensure the node of the followed file is expanded
          collapse_others = false,
        },
        follow_current_file = true,
        group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
        group_empty_dirs = true, -- when true, empty directories will be grouped together
        show_unloaded = true, -- show diagnostics from unloaded buffers
      },

      window = {
        mapping_options = {
          noremap = true,
          nowait = true,
        },

        mappings = {
          ['<space>'] = {
            'toggle_node',
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ['<2-LeftMouse>'] = 'open_with_window_picker',
          ['<cr>'] = 'open_with_window_picker',
          ['S'] = 'open_split',
          ['s'] = 'none',
          -- ['S'] = 'split_with_window_picker',
          -- ['s'] = 'vsplit_with_window_picker',
          ['t'] = 'none',
          ['w'] = 'open_with_window_picker',
          ['C'] = 'close_node',
          ['z'] = 'close_all_nodes',
          --['Z'] = 'expand_all_nodes',
          ['a'] = {
            'add',
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = 'none' -- 'none', 'relative', 'absolute'
            }
          },
          ['A'] = 'add_directory', -- also accepts the optional config.show_path option like 'add'.
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like 'add':
          -- ['c'] = {
          --  'copy',
          --  config = {
          --    show_path = 'none' -- 'none', 'relative', 'absolute'
          --  }
          --}
          ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like 'add'.
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
        }
      },
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>ft',
        cmd = 'Neotree reveal left',
      },
    }
  }
}
