vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_allow_resize = 1

-- Package loading.
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'tjdevries/colorbuddy.vim'

  use {
    'sainnhe/edge',
    config = function()
      vim.g.edge_style = 'neon'
      vim.g.edge_enable_italic = 1
      vim.g.edge_better_performance = 1
      vim.g.edge_diagnostic_text_highlight = 1
      vim.g.edge_diagnostic_line_highlight = 1
      vim.g.edge_diagnostic_virtual_text = 'colored'
      vim.g.edge_spell_foreground = 'colored'

      vim.cmd('colorscheme edge')

      -- edge overrides Hop and I don’t really like its default, it’s too dimmed to me; so we re-insert them
      vim.api.nvim_command('highlight HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
      vim.api.nvim_command('highlight HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')
      vim.api.nvim_command('highlight HopNextKey2 guifg=#2b8db3 ctermfg=33')
      vim.api.nvim_command('highlight HopUnmatched guifg=#666666 guibg=bg guisp=#666666 ctermfg=242')
    end
  }

  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("nvim-lsp-installer").setup {}
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
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
          enable = true
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
      }
    end
  }

  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-gps'.setup()
    end
  }

  use {
    -- 'phaazon/hop.nvim',
    '~/dev/hop.nvim',
    -- branch = "v1",
    config = function()
      require'hop'.setup {
        keys = 'etovxqpdygfblzhckisuran',
      }
    end
  }

  use {
    'phaazon/mind.nvim',
    config = function()
      require'mind'.setup()
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require'nvim-autopairs'.setup()
    end
  }

  use 'b3nj5m1n/kommentary'

  use 'mfussenegger/nvim-dap'

  use {
    'dcampos/nvim-snippy',
    config = function()
      require("snippy").setup {
        snippet_dirs = '~/.config/nvim/snippets',
        mappings = {
          is = {
            ["<Tab>"] = "expand_or_advance",
            ["<S-Tab>"] = "previous",
          },
        },
      }
    end
  }
  use 'dcampos/cmp-snippy'

  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      local snippy = require'snippy'

      local icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "⌘",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "廓",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      cmp.setup {
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = icons[vim_item.kind]

            return vim_item
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        snippet = {
          expand = function(args)
            snippy.expand_snippet(args.body)
          end,
        },

        mapping = {
          ['<C-s>'] = cmp.mapping.select_prev_item(),
          ['<C-t>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        },

        sources = {
          { name = 'crates' },
          { name = 'nvim_lsp' },
          { name = 'snippy' },
        },
      }

      -- Set up lsp completion for nvim-cmp
      require('cmp_nvim_lsp').setup {}
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    as = 'nvim-tree',
    config = function()
      local tree_cb = require'nvim-tree.config'.nvim_tree_callback

      require'nvim-tree'.setup {
        update_focused_file = {
          enable = true,
        },
        view = {
          mappings = {
            custom_only = true,
            list = {
              -- default mappings
              { key = { "<CR>", "<TAB>" },   cb = tree_cb("edit") },
              { key = { "o" },      cb = tree_cb("cd") },
              { key = { "<C-v>" },  cb = tree_cb("vsplit") },
              { key = { "<C-o>" },  cb = tree_cb("split") },
              { key = { "<C-t>" },  cb = tree_cb("tabnew") },
              { key = { "<BS>" },   cb = tree_cb("close_node") },
              { key = { "<S-CR>" }, cb = tree_cb("close_node") },
              { key = { "<Tab>" },  cb = tree_cb("preview") },
              { key = { "I" },      cb = tree_cb("toggle_ignored") },
              { key = { "." },      cb = tree_cb("toggle_dotfiles") },
              { key = { "R" },      cb = tree_cb("refresh") },
              { key = { "a" },      cb = tree_cb("create") },
              { key = { "d" },      cb = tree_cb("remove") },
              { key = { "r" },      cb = tree_cb("rename") },
              { key = { "<C-r>" },  cb = tree_cb("full_rename") },
              { key = { "x" },      cb = tree_cb("cut") },
              { key = { "y" },      cb = tree_cb("copy") },
              { key = { "p" },      cb = tree_cb("paste") },
              { key = { "c" },      cb = tree_cb("dir_up") },
              { key = { "q" },      cb = tree_cb("close") },
            },
          }
        }
      }
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require'nvim-lsp-installer'.setup()
      require'config.lsp'
    end
  }

  use {
    'nvim-lua/lsp-status.nvim',
    as = 'lsp-status'
  }

  use 'universal-ctags/ctags'

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      local actions = require'telescope.actions'

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

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")

      vim.cmd [[autocmd FileType TelescopePrompt inoremap <C-W> <C-S-W>]]
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = { { 'nvim-telescope/telescope.nvim' } },
    run = 'make',
  }

  use {'nvim-telescope/telescope-ui-select.nvim' }

  use {
    'saecki/crates.nvim',
    branch = 'main',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup {
        popup = {
          show_version_date = true,
        }
      }
    end,
  }

  -- Visual & graphics.
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  use 'ryanoasis/vim-devicons'

  use 'kyazdani42/nvim-web-devicons'

  use {
    'lukas-reineke/indent-blankline.nvim',
    -- disable = true,
    config = function()
      require'indent_blankline'.setup {
        char = '│',
        use_treesitter = true,
      }
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require'notify'
    end
  }

  use 'petrbroz/vim-glsl'

  use 'towolf/vim-helm'

  use 'mzlogin/vim-markdown-toc'

  use 'vmchale/dhall-vim'

  use 'purescript-contrib/purescript-vim'

  use 'hashivim/vim-terraform'

  use 'tpope/vim-fugitive'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = {hl = 'GitSignsAdd'   , text = '▍', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
          change       = {hl = 'GitSignsChange', text = '▍', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          delete       = {hl = 'GitSignsDelete', text = '▂', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '▍', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        },
        keymaps = {
          noremap = true,

          ['n <leader>gp'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
          ['n <leader>gn'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
          ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ['n <leader>gx'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ['v <leader>gx'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>gX'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
          ['n <leader>gh'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',

          -- Text objects
          ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
        }
      })
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    branch = 'main',
    config = function()
      require('trouble').setup()
    end
  }

  use {
    'chentoast/marks.nvim',
    config = function()
      require'marks'.setup({})
    end
  }
end)
