-- symbol kind kind labels
local symbol_kind_labels = {
  ' '; -- text
  ' '; -- method
  ' '; -- function
  ' '; -- ctor
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

local symbol_kind_labels_map = {
  ['File'] = '',
	['Module'] = '全',
	['Namespace'] = '',
	['Package'] = '',
	['Class'] = '',
	['Method'] = '',
	['Property'] = '',
	['Field'] = '',
	['Constructor'] = '',
	['Enum'] = '螺',
	['Interface'] = '',
	['Function'] = '',
	['Variable'] = '',
	['Constant'] = '',
	['String'] = '',
	['Number'] = '7',
	['Boolean'] = '',
	['Array'] = '',
	['Object'] = '',
	['Key'] = '',
	['Null'] = '',
	['EnumMember'] = '',
	['Struct'] = '',
	['Event'] = '',
	['Operator'] = '璉',
	['TypeParameter'] = '',
}

-- status
local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config {
  current_function = true,
  kind_labels = symbol_kind_labels_map,
  status_symbol = '%#StatusLineLinNbr#LSP',
  indicator_errors = '%#StatusLineLSPErrors#',
  indicator_warnings = '%#StatusLineLSPWarnings#',
  indicator_info = '%#StatusLineLSPInfo#',
  indicator_hints = '%#StatusLineLSPHints#',
  indicator_ok = '%#StatusLineLSPOk#',
}

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

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

    if args == nil or args.format == nil or args.format then
      vim.api.nvim_exec([[
        augroup lsp_formatting_sync
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]], false)
    end

    protocol.CompletionItemKind = symbol_kind_labels

    lsp_status.on_attach(client)

    -- keybindings
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>clr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-a>', '<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>CodeActions<cr>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-a>', '<cmd>CodeActions<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ca', '<cmd>Telescope lsp_range_code_actions theme=get_dropdown<cr>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ca', '<cmd>RangeCodeActions<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cD', '<cmd>Telescope lsp_references<cr>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cD', '<cmd>References<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cn', "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cp', "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()()<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cs', '<cmd>Telescope lsp_workspace_symbols<cr>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cs', '<cmd>WorkspaceSymbols<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cS', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols { query = '#' }<cr>", {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cS', "<cmd>lua require'fzf_lsp'.workspace_symbol_call({ query = '#'})<cr>", {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cx', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', {})
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
  capabilities = capabilities,
  cmd = { "/home/phaazon/foss/rust-analyzer/target/release/rust-analyzer" },
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGroup = true,
        importMergeBehaviour = "full",
        importPrefix = "by_crate",
      },

      callInfo = {
        full = true,
      };

      cargo = {
        allFeatures = true,
        autoreload = true,
        loadOutDirsFromCheck = true,
      },

      checkOnSave = {
        enable = true,
        allFeatures = true,
      },

      completion = {
        addCallArgumentSnippets = true,
        addCallParenthesis = true,
        postfix = {
          enable = true,
        },
        autoimport = {
          enable = true,
        },
      },

      diagnostics = {
        enable = true,
        enableExperimental = true,
      },

      hoverActions = {
        enable = true,
        debug = true,
        gotoTypeDef = true,
        implementations = true,
        run = true,
        linksInHover = true,
      },

      inlayHints = {
        chainingHints = true,
        parameterHints = true,
        typeHints = true,
      },

      lens = {
        enable = true,
        debug = true,
        implementations = true,
        run = true,
        methodReferences = true,
        references = true,
      },

      notifications = {
        cargoTomlNotFound = true,
      },

      procMacro = {
        enable = true,
      },
    },
  },

  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>bb', '<cmd>belowright 10sp | term cargo build<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>bc', '<cmd>belowright 10sp | term cargo check<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>br', '<cmd>belowright 10sp | term cargo build --release<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>db', '<cmd>belowright 10sp | term rustup doc --book<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>dd', '<cmd>belowright 10sp | term cargo doc --open<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>ds', '<cmd>belowright 10sp | term rustup doc --std<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>rd', '<cmd>belowright 10sp | term cargo run<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>rr', '<cmd>belowright 10sp | term cargo run --release<cr>', {})

    vim.g.which_key_local_map = {
      b = {
        name = '+build',
        b = 'build',
        c = 'check',
        r = 'build (release)',
      },
      d = {
        name = '+documentation',
        b = 'open the book',
        d = 'document everything',
        s = 'standard library documentation',
      },
      r = {
        name = '+run',
        d = 'debug run',
        r = 'release run',
      },
    }
    return lsp_attach()(client, bufnr)
  end
}

-- Haskell.
lsp.hls.setup {
  on_attach = lsp_attach {},
}

-- C/C++.
lsp.clangd.setup{
  on_attach = lsp_attach {},
}

-- Vue.
lsp.vuels.setup{
  on_attach = lsp_attach { format = false },
}
