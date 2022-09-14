return {
  config = function()
    require'mason'.setup {
      ui = {
        icons = {
          package_installed = '✓'
        }
      }
    }
  end
}
