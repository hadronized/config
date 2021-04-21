local M = {}

-- Setup a colorscheme.
--
-- The `colorscheme` argument is the name of the colorscheme to switch to. If non nil, it will switch to the
-- colorescheme and install autocommands to override its highlights.
function M.setup(colorscheme, colorbuddy)
  if colorscheme ~= nil then
    if colorbuddy then
      require'colorbuddy'.colorscheme(colorscheme)
    else
      vim.api.nvim_command('colorscheme ' .. colorscheme)
    end

    vim.api.nvim_command([[augroup EdgeCustom]])
    vim.api.nvim_command([[  autocmd!]])
    vim.api.nvim_command(string.format("  autocmd ColorScheme %s lua require'config.colorscheme'.setup()", colorscheme))
    vim.api.nvim_command([[augroup END]])
  end

  vim.api.nvim_exec([[
    hi! link markdownLinkTextDelimiter NonText
    hi! link markdownLinkDelimiter NonText
    hi! link markdownCodeDelimiter NonText
    hi! link markdownItalicDelimiter NonText
    hi! link markdownBoldDelimiter NonText
    hi! link markdownh1Delimiter NonText
    hi! link markdownh2Delimiter NonText
    hi! link markdownh3Delimiter NonText
    hi! link markdownh4Delimiter NonText
    hi! link markdownh5Delimiter NonText
    hi! link markdownh6Delimiter NonText
    hi! link mkdHeading NonText
    hi! link markdownLinkText TextInfo
    "hi! markdownh1 guifg=#ff6c6b gui=bold
    "hi! markdownh2 guifg=#ff6c6b gui=bold
    "hi! markdownh3 guifg=#ff6c6b gui=bold
    "hi! markdownh4 guifg=#ff6c6b gui=bold
    "hi! markdownh5 guifg=#ff6c6b gui=bold
    "hi! markdownh6 guifg=#ff6c6b gui=bold
    hi! link markdownUrl Symbol
    hi! markdownCode guifg=#98be65 guibg=#2E323C
    hi! markdownItalic guifg=#a9a1e1 gui=italic
    hi! markdownBold guifg=#da8548 gui=bold
    hi! markdownListMarker guifg=#ff6c6b
    hi! htmlItalic guifg=#a9a1e1 gui=italic
    hi! htmlBold guifg=#da8548 gui=bold
    hi! link LspDiagnosticsVirtualTextHint LspDiagnosticsSignHint
    hi! link LspDiagnosticsVirtualTextInformation LspDiagnosticsSignInformation
    hi! link LspDiagnosticsVirtualTextWarning LspDiagnosticsSignWarning
    hi! link LspDiagnosticsVirtualTextError LspDiagnosticsSignError

    hi! link BookmarkSign GreenSign
    hi! link BookmarkAnnotationSign BlueSign

    hi! link mkdxCheckboxPending GreenSign
    hi! link mkdxCheckboxEmpty BlueSign
    hi! link mkdxCheckboxComplete NonText
  ]], false)
end

M.setup('material', true)

return M
