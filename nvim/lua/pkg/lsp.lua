return {
  config = function()
    -- Useful configuration for multi-platform environments.
    local user_home = os.getenv("HOME") or "/tmp"
    local foss_path = string.format("%s/foss", user_home)

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    vim.cmd [[
    hi StatusLineLinNbr guibg=#23272e guifg=#51afef
    hi StatusLineLSPOk guibg=#23272e guifg=#98be65
    hi StatusLineLSPErrors guibg=#23272e guifg=#ff6c6b
    hi StatusLineLSPWarnings guibg=#23272e guifg=#ECBE7B
    hi StatusLineLSPInfo guibg=#23272e guifg=#51afef
    hi StatusLineLSPHints guibg=#23272e guifg=#c678dd
    ]]

    -- Prefix diagnostic virtual text
    vim.diagnostic.config {
      virtual_text = {
        source = "always",
        prefix = "» ",
        spacing = 6,
      },
      float = {
        header = false,
        source = "always",
      },
      signs = false,
      underline = false,
      update_in_insert = false,
    }

    local lsp = require'lspconfig'
    local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
    lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)

    -- attach
    local lsp_attach = function(args)
      return function(client, bufnr)
        if args == nil or args.format == nil or args.format then
          vim.api.nvim_exec([[
          augroup lsp_formatting_sync
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
          augroup END
          ]], false)
        end

        -- make omnifunc go via LSP’s completion directly
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- keybindings
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'S', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>clr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cD', '<cmd>Telescope lsp_references theme=get_dropdown <cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ci', '<cmd>Telescope lsp_implementations theme=get_dropdown <cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cn', "<cmd>lua vim.diagnostic.goto_next()<cr>", {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cp', "<cmd>lua vim.diagnostic.goto_prev()<cr>", {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cs', '<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_dropdown <cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cx', '<cmd>TroubleToggle<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ca', '<cmd>Telescope lsp_range_code_actions theme=get_dropdown<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-a>', '<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
      end
    end

    -- Lua.
    lsp.sumneko_lua.setup {
      capabilities = lsp_capabilities,
      cmd = {
        string.format("%s/lua-language-server/bin/platform/lua-language-server", foss_path),
        "-E",
        string.format("%s/lua-language-server/main.lua", foss_path)
      },
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
      capabilities = lsp_capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGroup = true,
            importGranularity = "crate",
            importPrefix = "crate",
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
      capabilities = lsp_capabilities,
      on_attach = lsp_attach {},
    }

    -- C/C++.
    lsp.clangd.setup {
      capabilities = lsp_capabilities,
      on_attach = lsp_attach {},
    }

    -- Vue.
    lsp.vuels.setup {
      capabilities = lsp_capabilities,
      on_attach = lsp_attach { format = false },
    }

    -- Python, sneeeek.
    -- lsp.pyls.setup {
    --   flags = lsp_flags,
    --   on_attach = lsp_attach {},
    -- }

    -- Purescript
    lsp.purescriptls.setup {
      capabilities = lsp_capabilities,
      on_attach = lsp_attach {},
    }

    -- Golang.
    lsp.gopls.setup {
      capabilities = lsp_capabilities,
      on_attach = lsp_attach {},
    }
  end
}
