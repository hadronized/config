local M = {}

function M.setup(colorscheme)
  vim.api.nvim_exec('colorscheme ' .. colorscheme, false)
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
    hi! link markdownLinkText TextInfo
    hi! markdownh1 guifg=#ff6c6b gui=bold
    hi! markdownh2 guifg=#ff6c6b gui=bold
    hi! markdownh3 guifg=#ff6c6b gui=bold
    hi! markdownh4 guifg=#ff6c6b gui=bold
    hi! markdownh5 guifg=#ff6c6b gui=bold
    hi! markdownh6 guifg=#ff6c6b gui=bold
    hi! link markdownUrl Symbol
    hi! markdownCode guifg=#98be65 guibg=#2E323C
    hi! markdownItalic guifg=#a9a1e1 gui=italic
    hi! markdownBold guifg=#da8548 gui=bold
    hi! markdownListMarker guifg=#ff6c6b
  ]], false)
end

M.setup('doom-one')

return M
