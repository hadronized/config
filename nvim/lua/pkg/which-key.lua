return {
  disable = true,
  config = function()
    local wk = require'which-key'
    wk.setup {
      triggers = { ' ' }
    }
  end
}
