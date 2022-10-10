return {
  disable = true,
  requires = {"mfussenegger/nvim-dap"},
  config = function()
    require'dapui'.setup()
  end
}
