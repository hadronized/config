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
  return function(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec([[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false)
    end

    if args.format == nil or args.format then
      vim.api.nvim_exec([[
        augroup lsp_formatting_sync
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]], false)
    end

    -- Use LSP as the handler for omnifunc.
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

    -- keybindings
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>clr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-a>', '<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ca', '<cmd>Telescope lsp_range_code_actions theme=get_dropdown<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cD', '<cmd>Telescope lsp_references<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ch', '<cmd>Lspsaga signature_help<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-h>', '<cmd>Lspsaga signature_help<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cn', "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cp', "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>Lspsaga rename<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cs', '<cmd>Telescope lsp_workspace_symbols<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cx', "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", {})
  end
end

-- saga
require'lspsaga'.init_lsp_saga {
  code_action_prompt = {
    enable = true,
    sign = false,
    virtual_text = true,
  },
}

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

  on_attach = function(client, bufnr)
    lsp_attach({ with_autocommands = true })(client, bufnr)

    -- override the default query so that we have everything everywhere
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cs', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols { query = '#' }<cr>", {})
  end
}

-- Haskell.
lsp.hls.setup {}

-- C/C++.
lsp.clangd.setup{}
