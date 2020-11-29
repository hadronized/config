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
hi StatusLineCommandMode guibg=#da8548 guifg=#efefef
hi StatusLineCommandModeItalic guibg=#da8548 guifg=#efefef gui=italic
hi StatusLineHitEnterPromptMode guibg=#ff6c6b guifg=#efefef
hi StatusLineHitEnterPromptModeItalic guibg=#ff6c6b guifg=#efefef gui=italic

function VcsStatus()
  let branch = fugitive#head()
  let b:branch_maxwin = 20

  if v:shell_error != 0
    return ''
  else
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('%%#StatusLineGitDiffAdd#+%d %%#StatusLineGitDiffMod#±%d %%#StatusLineGitDiffDel#-%d %%#StatusLineGitBranchSymbol#%%#StatusLineGitBranchName#%%-.%d(%s%%)', a, m, r, b:branch_maxwin, trim(branch))
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
    let sl .= printf(' %d', errors)

    let warnings = luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
    if warnings > 0
      let sl .= '%#StatusLineLSPWarnings#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= printf('  %d', warnings)

    let informations = luaeval("vim.lsp.diagnostic.get_count(0, [[Information]])")
    if informations > 0
      let sl .= '%#StatusLineLSPInformations#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= printf('  %d', informations)

    let hints = luaeval("vim.lsp.diagnostic.get_count(0, [[Hints]])")
    if hints > 0
      let sl .= '%#StatusLineLSPHints#'
    else
      let sl .= '%#StatusLineBg2b#'
    end
    let sl .= printf('  %d', hints)
  endif

  return sl
endfunction

function GetFileName()
  let b:file_name = expand('%')
  let b:minwin = 10
  let b:maxwin = 30

  if strwidth(b:file_name) == 0
    let b:file_name = '<scratch>'
  elseif exists('*WebDevIconsGetFileTypeSymbol')
    let b:file_name = printf('%s %s', WebDevIconsGetFileTypeSymbol(), b:file_name)
  endif

  return printf('%%-%d.%d(%s%%)', b:minwin, b:maxwin, b:file_name)
endfunction

function MakeStatusLine()
  let b:hls = {
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
    \ '': {
      \ 'n': 'StatusLineVisualBlockMode',
      \ 'i': 'StatusLineVisualBlockModeItalic'
      \ },
    \ 'R': {
      \ 'n': 'StatusLineReplaceMode',
      \ 'i': 'StatusLineReplaceModeItalic'
      \ },
    \ 'c': {
      \ 'n': 'StatusLineCommandMode',
      \ 'i': 'StatusLineCommandModeItalic'
      \ },
    \ 'r?': {
      \ 'n': 'StatusLineHitEnterPromptMode',
      \ 'i': 'StatusLineHitEnterPromptModeItalic'
      \ },
    \ }
  let b:hl = 'StatusLineBg'

  if has_key(b:hls, mode()) == 1
    if &mod
      let b:hl = b:hls[mode()]['i']
    else
      let b:hl = b:hls[mode()]['n']
    endif
  endif

  let b:status_line = printf('%%#%s# %s ', b:hl, GetFileName())
  let b:status_line .= '%#StatusLineLinNbr# %v%#StatusLineBg2b#:%#StatusLineColNbr#%l %#StatusLineBg2b#(%p%% %LL)'
  let b:status_line .= printf('%%=%%#StatusLineBg# %s %s ', LspStatus(), VcsStatus())

  return b:status_line
endfunction

function ShowMode()
  return string(mode())
endfunction

set statusline=%!MakeStatusLine()
