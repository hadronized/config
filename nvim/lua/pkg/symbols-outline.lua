return {
  init = function()
    vim.g.symbols_outline = {
      position = 'right',
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>cO';
        cmd = 'SymbolsOutline'
      }
    }
  }
}
