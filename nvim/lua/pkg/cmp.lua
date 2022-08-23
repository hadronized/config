return {
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
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'git' },
        { name = 'snippy' },
      },

      experimental = {
        ghost_text = true,
      }
    }

    -- Set up lsp completion for nvim-cmp
    require('cmp_nvim_lsp').setup {}
  end
}
