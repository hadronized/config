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

vim.g.material_style = 'palenight'
vim.g.material_italic_keywords = true
vim.g.material_hide_eob = true

-- Package loading.
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Themes
  use {
    'romgrk/doom-one.vim',
    config = function()
      vim.cmd('colorscheme doom-one')
    end
  }

  -- https://github.com/rose-pine/neovim
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      -- require('rose-pine.functions').select_variant('moon')
    end
  }

  use {
    'marko-cerovac/material.nvim',
    config = function()
    end
  }

  --[[ use {
    'NTBBloodbath/doom-one.nvim',
  } ]]

  -- Productivity.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

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
    'windwp/nvim-autopairs',
    config = function()
      require'nvim-autopairs'.setup()
    end
  }

  use 'b3nj5m1n/kommentary'

  use 'mfussenegger/nvim-dap'

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
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = {
          border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
          winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
        };

        source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          luasnip = true;
        };
      }
    end
  }

  use {
    'romgrk/nvim-treesitter-context',
    requires = { { 'nvim-treesitter/nvim-treesitter' } },
    config = function()
      require'treesitter-context'.setup {
        enable = false,
      }
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    as = 'nvim-tree',
    config = function()
      local tree_cb = require'nvim-tree.config'.nvim_tree_callback
      vim.g.nvim_tree_bindings = {
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
      }
    end
  }

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require'neogit'.setup {}
    end
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
        org_indent_mode = 'noindent',
        org_hide_leading_stars = true,
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
      require'colorizer'.setup {}
    end
  }

  use 'ryanoasis/vim-devicons'

  use 'kyazdani42/nvim-web-devicons'

  use {
    'yamatsum/nvim-web-nonicons',
    requires = { { 'kyazdani42/nvim-web-devicons' } },
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require'indent_blankline'.setup {
        char = '│',
        use_treesitter = true,
      }
    end
  }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    disable = true
  }

  use {
    'ojroques/nvim-hardline',
    config = function()
      require'hardline'.setup {}
    end
  }

  -- Languages.
  use 'petrbroz/vim-glsl'

  use 'towolf/vim-helm'

  use 'mzlogin/vim-markdown-toc'

  use 'vmchale/dhall-vim'

  use 'purescript-contrib/purescript-vim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup({
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
          ['n <leader>gB'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

          -- Text objects
          ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
        }
      })
    end
  }

  use 'L3MON4D3/LuaSnip'
end)
