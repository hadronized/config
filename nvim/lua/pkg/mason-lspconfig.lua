
return {
  config = function()
    require'mason-lspconfig'.setup {
      ensure_installed = { 'sumneko_lua' }
    }
  end
}
