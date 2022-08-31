return {
  branch = 'main',
  config = function()
    require'fidget'.setup {
      text = {
        spinner = "dots_pulse",
      }
    }
  end
}
