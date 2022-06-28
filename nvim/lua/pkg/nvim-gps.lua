return {
  requires = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require'nvim-gps'.setup {}
  end
}
