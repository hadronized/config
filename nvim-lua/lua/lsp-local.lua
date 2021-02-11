-- handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

local lsp = require'lspconfig'
local protocol = require'vim.lsp.protocol'

local lsp_attach = function(args)
  return function()
    -- autocommands
    vim.api.nvim_command([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])

    if args.format == nil or args.format then
      vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
    end

    -- Use LSP as the handler for omnifunc.
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    require'completion'.on_attach()
    protocol.CompletionItemKind = {
      ' '; -- text
      ' '; -- method
      ' '; -- function
      '全'; -- ctor
      ' '; -- field
      ' '; -- variable
      ' '; -- class
      ' '; -- interface
      ' '; -- module
      ' '; -- property
      ' '; -- unit
      ' '; -- value
      '螺'; -- enum
      ' '; -- keyword
      ' '; -- snippet
      ' '; -- color
      ' '; -- file
      ' '; -- reference
      ' '; -- folder
      ' '; -- enum member
      ' '; -- constant
      ' '; -- struct
      ' '; -- event
      '璉'; -- operator
      ' '; -- type parameter
    }
  end
end

-- Lua.
lsp.sumneko_lua.setup {
  cmd = { "/home/phaazon/foss/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/phaazon/foss/lua-language-server/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },

      diagnostics = {
        enable = true,
        globals = { "vim" },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },

  on_attach = lsp_attach { format = false },
}

-- Rust.
lsp.rust_analyzer.setup {
  cmd = { "/home/phaazon/foss/rust-analyzer/target/release/rust-analyzer" },

  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehaviour = "full",
        importPrefix = "by_crate",
      },

      callInfo = {
        full = true,
      };

      cargo = {
        loadOutDirsFromCheck = true
      },

      checkOnSave = {
        allFeatures = true,
      },

      procMacro = {
        enable = true,
      },
    },
  },

  on_attach = lsp_attach { with_autocommands = true },
}

-- Haskell.
lsp.hls.setup {}

-- C/C++.
lsp.clangd.setup{}

local saga = require'lspsaga'
saga.init_lsp_saga()
