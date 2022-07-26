return {
  run = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      renderer = {
        indent_markers = {
          enable = true,
        },

        root_folder_modifier = ':.',

        show_icons = {
          git = true,
          folder = true,
          file = true,
        },


        icons = {
          glyph = {
            default = '',
            symlink = '',
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              untracked = '★'
            },
            folder = {
              default = '',
              open = ''
            },
          },
        },

        higlight_git = true,
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

      textobjects = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      autotag = {
        enable = true,
      }
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>ft',
        cmd = 'NvimTreeToggle'
      }
    }
  }
}
