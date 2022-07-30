return {
  config = function()
    require'nvim-treesitter.configs'.setup {
      autotag = {
        enable = true,
      }
    }
  end
}
