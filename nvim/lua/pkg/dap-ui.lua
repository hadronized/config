return {
  requires = { "mfussenegger/nvim-dap" },
  config = function()
    require'dapui'.setup()
  end
}
