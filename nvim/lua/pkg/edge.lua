return {
  config = function()
    vim.g.edge_style = 'neon'
    vim.g.edge_enable_italic = 1
    vim.g.edge_better_performance = 1
    vim.g.edge_diagnostic_text_highlight = 1
    vim.g.edge_diagnostic_line_highlight = 1
    vim.g.edge_diagnostic_virtual_text = 'colored'
    vim.g.edge_spell_foreground = 'colored'

    vim.cmd('colorscheme edge')

    -- edge overrides Hop and I don’t really like its default, it’s too dimmed to me; so we re-insert them
    vim.api.nvim_command('highlight HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
    vim.api.nvim_command('highlight HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')
    vim.api.nvim_command('highlight HopNextKey2 guifg=#2b8db3 ctermfg=33')
    vim.api.nvim_command('highlight HopUnmatched guifg=#666666 guibg=bg guisp=#666666 ctermfg=242')
  end
}
