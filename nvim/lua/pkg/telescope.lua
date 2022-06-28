return {
  config = function()
    local actions = require'telescope.actions'

    -- config
    require'telescope'.setup {
      defaults = {
        mappings = {
          i = {
            ["<c-s>"] = actions.move_selection_previous,
            ["<c-t>"] = actions.move_selection_next,
            ["<tab>"] = actions.add_selection,
            ["<esc>"] = actions.close,
          },
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },

        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- more options
          },
        }
      }
    }

    -- extensions
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")

    vim.cmd [[autocmd FileType TelescopePrompt inoremap <C-W> <C-S-W>]]
  end,
  keybindings = {
    n = {
      {
        key = "<leader>'",
        cmd = 'Telescope resume',
      },

      {
        key = '<leader>bb',
        cmd = 'Telescope buffers theme=get_dropdown previewer=false',
      },
      {
      key = '<leader>ff',
        cmd = 'Telescope find_files theme=get_dropdown previewer=false',
      },
      {
        key = '<leader><leader>',
        cmd = 'Telescope git_files theme=get_dropdown previewer=false',
      },
      {
        key = '<leader>gcb',
        cmd = 'Telescope git_branches theme=get_dropdown previewer=false',
      },
      {
        key = '<leader>gcc',
        cmd = 'Telescope git_commits',
      },
      {
        key = '<leader>sc',
        cmd = 'Telescope command_history',
      },
      {
        key = '<leader>sm',
        cmd = 'Telescope marks',
      },
      {
        key = '<leader>sp',
        cmd = 'Telescope live_grep theme=get_dropdown',
      },
      {
        key = '<leader>sr',
        cmd = 'Telescope registers theme=get_dropdown',
      },
      {
        key = '<leader>ss',
        cmd = 'Telescope current_buffer_fuzzy_find theme=get_dropdown previewer = false',
      },
      {
        key = '<leader>fh',
        cmd = 'Telescope oldfiles theme=get_dropdown previewer=false',
      },
    }
  }
}
