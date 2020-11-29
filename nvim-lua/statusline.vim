hi StatusLineBg guibg=#23272e guifg=#efefef
hi StatusLineBg2 guibg=#23272e guifg=#efefef
hi StatusLineBg2b guibg=#23272e guifg=#5B6268
hi StatusLineLinNbr guibg=#23272e guifg=#51afef
hi StatusLineColNbr guibg=#23272e guifg=#98be65

hi StatusLineGitBranchSymbol guibg=#23272e guifg=#ff6c6b
hi StatusLineGitBranchName guibg=#23272e guifg=#da8548 gui=italic
hi StatusLineGitDiffAdd guibg=#23272e guifg=#98be65
hi StatusLineGitDiffMod guibg=#23272e guifg=#51afef
hi StatusLineGitDiffDel guibg=#23272e guifg=#ff6c6b

hi StatusLineLSPErrors guibg=#23272e guifg=#ff6c6b
hi StatusLineLSPWarnings guibg=#23272e guifg=#ECBE7B
hi StatusLineLSPInformations guibg=#23272e guifg=#51afef
hi StatusLineLSPHints guibg=#23272e guifg=#c678dd

hi StatusLineNormalMode guibg=#51afef guifg=#efefef
hi StatusLineNormalModeItalic guibg=#51afef guifg=#efefef gui=italic
hi StatusLineInsertMode guibg=#98be65 guifg=#efefef
hi StatusLineInsertModeItalic guibg=#98be65 guifg=#efefef gui=italic
hi StatusLineReplaceMode guibg=#ff6c6b guifg=#efefef
hi StatusLineReplaceModeItalic guibg=#ff6c6b guifg=#efefef gui=italic
hi StatusLineVisualMode guibg=#c678dd guifg=#efefef
hi StatusLineVisualModeItalic guibg=#c678dd guifg=#efefef gui=italic
hi StatusLineVisualBlockMode guibg=#c678dd guifg=#efefef
hi StatusLineVisualBlockModeItalic guibg=#c678dd guifg=#efefef gui=italic
hi StatusLineVisualLineMode guibg=#c678dd guifg=#efefef
hi StatusLineVisualLineModeItalic guibg=#c678dd guifg=#efefef gui=italic
hi StatusLineSelectMode guibg=#46D9FF guifg=#efefef
hi StatusLineSelectModeItalic guibg=#46D9FF guifg=#efefef gui=italic
hi StatusLineSelectLineMode guibg=#46D9FF guifg=#efefef
hi StatusLineSelectLineModeItalic guibg=#46D9FF guifg=#efefef gui=italic
hi StatusLineSelectBlockMode guibg=#46D9FF guifg=#efefef
hi StatusLineSelectBlockModeItalic guibg=#46D9FF guifg=#efefef gui=italic

function VcsStatus()
  let branch = system('git rev-parse --abbrev-ref HEAD')

  if v:shell_error != 0
    return ''
  else
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('%%#StatusLineGitDiffAdd#+%d %%#StatusLineGitDiffMod#±%d %%#StatusLineGitDiffDel#-%d %%#StatusLineGitBranchSymbol#%%#StatusLineGitBranchName#%s', a, m, r, trim(branch))
  end
endfunction

function! LspStatus() abort
  let sl = ''

  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let errors = luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
    if errors > 0
      let sl .= '%#StatusLineLSPErrors#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= ' ' . errors

    let warnings = luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
    if warnings > 0
      let sl .= '%#StatusLineLSPWarnings#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= '  ' . warnings

    let informations = luaeval("vim.lsp.diagnostic.get_count(0, [[Information]])")
    if informations > 0
      let sl .= '%#StatusLineLSPInformations#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= '  ' . informations

    let hints = luaeval("vim.lsp.diagnostic.get_count(0, [[Hints]])")
    if hints > 0
      let sl .= '%#StatusLineLSPHints#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= '  ' . hints
  endif

  return sl
endfunction

function MakeStatusLine()
  let file_name = expand("%:.")
  let hls = {
    \ 'n': {
      \ 'n': 'StatusLineNormalMode',
      \ 'i': 'StatusLineNormalModeItalic'
      \ },
    \ 'i': {
      \ 'n': 'StatusLineInsertMode',
      \ 'i': 'StatusLineInsertModeItalic'
      \ },
    \ 'v': {
      \ 'n': 'StatusLineVisualMode',
      \ 'i': 'StatusLineVisualModeItalic'
      \ },
    \ 'V': {
      \ 'n': 'StatusLineVisualLineMode',
      \ 'i': 'StatusLineVisualLineModeItalic'
      \ },
    \ '^V': {
      \ 'n': 'StatusLineVisualBlockMode',
      \ 'i': 'StatusLineVisualBlockModeItalic'
      \ },
    \ 'R': {
      \ 'n': 'StatusLineReplaceMode',
      \ 'i': 'StatusLineReplaceModeItalic'
      \ },
    \ }
  let hl = 'StatusLineBg'

  if strwidth(file_name) == 0
    let file_name = "<scratch>"
  elseif exists('*WebDevIconsGetFileTypeSymbol')
    let file_name = WebDevIconsGetFileTypeSymbol() . ' ' . file_name
  endif

  if has_key(hls, mode()) == 1
    if &mod
      let hl = hls[mode()]['i']
    else
      let hl = hls[mode()]['n']
    endif
  endif

  let first_part = '%#' . hl . '# ' . file_name . ' '
  let second_part = '%#StatusLineLinNbr# %v%#StatusLineBg2b#:%#StatusLineColNbr#%l %#StatusLineBg2b#(%p%% %LL)'
  let third_part = '%=%#StatusLineBg# LSP_SYMBOL ' . LspStatus() . ' ' . VcsStatus() . ' '

  return first_part . second_part . third_part
endfunction

function ShowMode()
  return string(mode())
endfunction

set statusline=%!MakeStatusLine()
