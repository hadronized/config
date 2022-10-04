return {
  requires = { 'rktjmp/lush.nvim' },
  disable = true,
  config = function()
    vim.cmd('colorscheme noctis')
    require 'colorscheme'
  end
}
