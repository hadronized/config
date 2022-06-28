return {
  config = function()
    require'indent_blankline'.setup {
      char = '│',
      use_treesitter = true,
    }
  end
}
