return {
  requires = 'kyazdani42/nvim-web-devicons',
  branch = 'main',
  config = function()
    require('trouble').setup {}
  end
}
