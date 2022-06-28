return {
  event = 'BufReadPre',
  module = 'persistence',
  config = function()
    require'persistence'.setup {}
  end,
}
