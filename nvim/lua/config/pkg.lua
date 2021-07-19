-- Package configuration — I fucking hate Lua.
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_enable_italic = true
vim.g.sonokai_cursor = 'red'
vim.g.sonokai_transparent_background = false
vim.g.sonokai_menu_selection_background = 'green'
vim.g.sonokai_sign_column_background = 'none'
vim.g.sonokai_diagnostic_line_highlight = true
vim.g.sonokai_current_word = 'grey background'
vim.g.sonokai_better_performance = true

vim.g.palenight_terminal_italics = 1

vim.g.material_style = "palenight"
vim.g.material_flat_ui = 0
vim.g.material_italic_comment = 1
vim.g.material_italic_keywords = 1
vim.g.material_italic_functions = 1

vim.g.embark_terminal_italics = 1

vim.g.edge_style = 'neon'
vim.g.edge_enable_italic = 1
vim.g.edge_cursor = 'auto'
vim.g.edge_menu_selection_background = 'purple'
vim.g.edge_diagnostic_text_highlight = 1
vim.g.edge_diagnostic_line_highlight = 1

vim.g.onedark_terminal_italics = 1

vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', '.target' }
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':.'
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}
vim.g.nvim_tree_icons = {
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
}

vim.g.gitgutter_map_keys = false
vim.g.gitgutter_max_signs = 10000
vim.g.gitgutter_sign_added = "▎"
vim.g.gitgutter_sign_modified = "▎"
vim.g.gitgutter_sign_removed = "▁"
vim.g.gitgutter_sign_removed_first_line = "▔"
vim.g.gitgutter_sign_modified_removed = "▎"
vim.g.gitgutter_highlight_linenrs = 0
vim.g.gitgutter_override_sign_column_highlight = false

vim.g.blameLineGitFormat = '   %an | %ar | %s'

vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-tab>'

vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_context_highlight = 'SpecialComment'

vim.g.idris_indent_if = 3
vim.g.idris_indent_let = 4
vim.g.idris_indent_where = 6
vim.g.idris_indent_do = 3
vim.g.idris_indent_rewrite = 8

vim.g.vim_markdown_new_list_item_indent = 2

vim.g.rust_recommended_style = 0

vim.g.bookmark_sign = '♥'
vim.g.bookmark_highlight_lines = 1

vim.g.snips_author = 'Dimitri Sabadie'

-- Package loading.
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'tjdevries/colorbuddy.vim'

  use 'romgrk/doom-one.vim'

  use 'sainnhe/sonokai'

  use { 'glepnir/zephyr-nvim', branch = 'main' }

  use { 'dracula/vim', as = 'dracula' }

  use { 'challenger-deep-theme/vim', as = 'challenger-deep' }

  use 'drewtempelmeyer/palenight.vim'

  use 'Rigellute/shades-of-purple.vim'

  use 'archseer/colibri.vim'

  use 'embark-theme/vim'

  use 'bkegley/gloombuddy'

  use 'sainnhe/edge'

  use 'joshdick/onedark.vim'

  use {
    'marko-cerovac/material.nvim',
    disable = true,
  }

  -- Productivity.
  use 'nvim-lua/popup.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'nvim-treesitter/nvim-treesitter'

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup {
        keys = 'etovxqpdygéèfblzhckisuran',
      }
    end
  }

  use {
    "vhyrro/neorg",
    config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = "~/neorg"
              }
            }
          }
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    'windwp/nvim-autopairs',
    disable = true,
    config = function()
      require'nvim-autopairs'.setup()
    end
  }

  use 'preservim/tagbar'

  use 'tpope/vim-commentary'

  use 'mfussenegger/nvim-dap'

  use 'MattesGroeger/vim-bookmarks'

  use {
    'hrsh7th/nvim-compe',
    as = 'compe',
    config = function()
      require'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = true;

        source = {
          path = true;
          buffer = true;
          calc = true;
          vsnip = false;
          nvim_lsp = true;
          nvim_lua = true;
          spell = true;
          tags = true;
          snippets_nvim = false;
          treesitter = false;
          ultisnips = true;
          orgmode = true;
        };
      }
    end
  }

  use {
    'romgrk/nvim-treesitter-context',
    disable = true,
    requires = { { 'nvim-treesitter/nvim-treesitter' } }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    as = 'nvim-tree',
    config = function()
      local tree_cb = require'nvim-tree.config'.nvim_tree_callback
      vim.g.nvim_tree_bindings = {
        -- default mappings
        { key = { "<CR>" },   cb = tree_cb("edit") },
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
      }
    end
  }

  use 'tpope/vim-fugitive'

  use 'airblade/vim-gitgutter'

  use 'tveskag/nvim-blame-line'

  use {
    'TimUntersberger/neogit',
    disable = false,
  }

  use {
    'pwntester/octo.nvim',
    disable = true,
  }

  use 'rafcamlet/nvim-luapad'

  use 'euclidianAce/BetterLua.vim'

  use 'neovim/nvim-lspconfig'

  use {
    'nvim-lua/lsp_extensions.nvim',
    as = 'lsp_extensions',
    config = function()
      vim.cmd [[
        au BufEnter,BufWinEnter,BufWritePost,InsertLeave,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = " » " }
      ]]
    end
  }

  use {
    'nvim-lua/lsp-status.nvim',
    as = 'lsp-status'
  }

  use 'honza/vim-snippets'

  use 'SirVer/ultisnips'

  use 'vim-test/vim-test'

  use { "rcarriga/vim-ultest", requires = {"janko/vim-test"}, run = ":UpdateRemotePlugins" }

  use 'universal-ctags/ctags'

  use 'nvim-telescope/telescope.nvim'

  use {
    'nvim-telescope/telescope-fzy-native.nvim',
    requires = { { 'nvim-telescope/telescope.nvim' } }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = { { 'nvim-telescope/telescope.nvim' } },
    run = 'make',
  }

  use {
    'kristijanhusak/orgmode.nvim',
    config = function()
      require'orgmode'.setup {
        org_agenda_files = {'~/org/*'},
        org_default_notes_file = '~/org/notes.org',
        org_todo_keywords = { 'TODO', 'WIP', 'HOLD', 'PROJ', '|', 'DONE', 'KILL' },
        mappings = {
          global = {
            org_agenda = '<leader>na',
            org_capture = '<leader>nn',
          },
          capture = {
            org_capture_finalize = 'C-c C-c',
            org_capture_refile = 'C-c C-r',
            org_capture_kill = 'C-c C-k',
          },
          org = {
            org_refile = 'C-c C-r',
            org_todo = '<localleader>t',
            org_todo_prev = '<localleader>T',
            org_archive_subtree = '<localleader>$',
            org_set_tags_command = '<localleader>q',
            org_toggle_archive_tag = '<localleader>A',
            org_meta_return = '<S-CR>',
            org_move_subtree_up = 'S',
            org_move_subtree_down = 'T',
          },
        },
      }
    end
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
    'yamatsum/nvim-web-nonicons',
    requires = { { 'kyazdani42/nvim-web-devicons' } },
    disable = true,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    disable = true,
  }

  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    disable = true
  }

  -- Languages.
  use 'petrbroz/vim-glsl'

  use 'towolf/vim-helm'

  use 'idris-hackers/idris-vim'

  -- use 'plasticboy/vim-markdown'

  use 'mzlogin/vim-markdown-toc'

  use {
    'SidOfc/mkdx',
    disable = true
  }

  -- use 'rust-lang/rust.vim'

  -- Convenience.
  use 'vim-scripts/SyntaxAttr.vim'
end)
