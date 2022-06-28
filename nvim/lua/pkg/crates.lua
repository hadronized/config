return {
  branch = 'main',
  event = { "BufRead Cargo.toml" },
  requires = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    require('crates').setup {
      popup = {
        show_version_date = true,
      }
    }
  end,
}
