-- Lua.
require'lspconfig'.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    },
  },
})

-- Rust.
require'lspconfig'.rust_analyzer.setup({
  settings = {
      ["rust-analyzer"] = {}
    }
})
