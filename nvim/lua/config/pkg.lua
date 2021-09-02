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
    'hrsh7th/nvim-cmp',
    requires = { 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      -- luasnip setup
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
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
          ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
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
    disable = true,
    config = function()
      require'indent_blankline'.setup {
        char = '│',
        use_treesitter = true,
      }
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

  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'
end)
