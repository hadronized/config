" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

hi StatusLineBg guibg=#23272e guifg=#efefef
hi StatusLineBg2 guibg=#23272e guifg=#efefef
hi StatusLineBg2b guibg=#23272e guifg=#5B6268
hi StatusLineBg2c guibg=#5B6268 guifg=#23272e

hi StatusLineLinNbr guibg=#23272e guifg=#51afef
hi StatusLineColNbr guibg=#23272e guifg=#98be65

hi StatusLineGitBranchSymbol guibg=#23272e guifg=#ff6c6b
hi StatusLineGitBranchName guibg=#23272e guifg=#da8548
hi StatusLineGitDiffNone guibg=#23272e guifg=#98be65
hi StatusLineGitDiffAdd guibg=#23272e guifg=#98be65
hi StatusLineGitDiffMod guibg=#23272e guifg=#51afef
hi StatusLineGitDiffDel guibg=#23272e guifg=#ff6c6b

hi StatusLineLSPOk guibg=#23272e guifg=#98be65
hi StatusLineLSPErrors guibg=#23272e guifg=#ff6c6b
hi StatusLineLSPWarnings guibg=#23272e guifg=#ECBE7B
hi StatusLineLSPInfo guibg=#23272e guifg=#51afef
hi StatusLineLSPHints guibg=#23272e guifg=#c678dd

hi StatusLineCurrentSymbolName guibg=#23272e guifg=#c678dd
hi StatusLineCurrentSymbolType guibg=#23272e guifg=#98be65 gui=italic
hi StatusLineCurrentSymbolBracket guibg=#23272e guifg=#5B6268 gui=italic

hi StatusLineNormalMode guibg=#51afef guifg=#23272e
hi StatusLineNormalModeItalic guibg=#51afef guifg=#23272e gui=italic
hi StatusLineNormalModeWinNr guibg=#316a91 guifg=#23272e

hi StatusLineInsertMode guibg=#98be65 guifg=#23272e
hi StatusLineInsertModeItalic guibg=#98be65 guifg=#23272e gui=italic
hi StatusLineInsertModeWinNr guibg=#62803b guifg=#23272e

hi StatusLineReplaceMode guibg=#ff6c6b guifg=#23272e
hi StatusLineReplaceModeItalic guibg=#ff6c6b guifg=#23272e
hi StatusLineReplaceModeWinNr guibg=#b64a49 guifg=#23272e

hi StatusLineVisualMode guibg=#46D9FF guifg=#23272e
hi StatusLineVisualModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineVisualModeWinNr guibg=#37a2be guifg=#23272e

hi StatusLineVisualBlockMode guibg=#46D9FF guifg=#23272e
hi StatusLineVisualBlockModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineVisualBlockModeWinNr guibg=#37a2be guifg=#23272e

hi StatusLineVisualLineMode guibg=#46D9FF guifg=#23272e
hi StatusLineVisualLineModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineVisualLineModeWinNr guibg=#37a2be guifg=#23272e

hi StatusLineSelectMode guibg=#46D9FF guifg=#23272e
hi StatusLineSelectModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineSelectModeWinNr guibg=#37a2be guifg=#23272e

hi StatusLineSelectLineMode guibg=#46D9FF guifg=#23272e
hi StatusLineSelectLineModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineSelectLineModeWinNr guibg=#37a2be guifg=#23272e

hi StatusLineSelectBlockMode guibg=#46D9FF guifg=#23272e
hi StatusLineSelectBlockModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineSelectBlockModeWinNr guibg=#37a2be guifg=#23272e

hi StatusLineCommandMode guibg=#5B6268 guifg=#23272e
hi StatusLineCommandModeItalic guibg=#5B6268 guifg=#23272e gui=italic
hi StatusLineCommandModeWinNr guibg=#42474b guifg=#23272e

hi StatusLineHitEnterPromptMode guibg=#ff6c6b guifg=#23272e
hi StatusLineHitEnterPromptModeItalic guibg=#ff6c6b guifg=#23272e gui=italic
hi StatusLineHitEnterPromptModeWinNr guibg=#b64a49 guifg=#23272e

function! VcsStatus()
  let branch = fugitive#head()
  let b:branch_maxwin = 20

  if branch == ""
    return ""
  endif

  let [a,m,r] = GitGutterGetHunkSummary()
  let ahl = ''
  let mhl = ''
  let rhl = ''
  if a > 0
    let ahl .= '%#StatusLineGitDiffAdd#'
  else
    let ahl .= '%#StatusLineBg2b#'
  end

  if m > 0
    let mhl .= '%#StatusLineGitDiffMod#'
  else
    let mhl .= '%#StatusLineBg2b#'
  end

  if r > 0
    let rhl .= '%#StatusLineGitDiffDel#'
  else
    let rhl .= '%#StatusLineBg2b#'
  end

  return printf('%s %d %s %d %s %d %%#StatusLineGitBranchSymbol# %%#StatusLineGitBranchName#%s', ahl, a, mhl, m, rhl, r, trim(branch))
endfunction

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

function! GetFileName()
  let b:max_width = 3 * winwidth(g:statusline_winid) / 4
  let b:file_name = bufname(winbufnr(g:statusline_winid))
  let b:width = strwidth(b:file_name)

  if b:width == 0
    let b:file_name = "[scratch]"
  else
    " If the file name is too big, we just write its tail part
    if b:width > b:max_width
      let b:file_name = fnamemodify(b:file_name, ':t')
    endif

    if exists('*WebDevIconsGetFileTypeSymbol')
      let b:file_name = printf('%s %s', WebDevIconsGetFileTypeSymbol(b:file_name), b:file_name)
    endif
  endif

  return b:file_name
endfunction

function! MakeActiveStatusLine()
  let b:hls = {
    \ 'n': {
      \ 'n': 'StatusLineNormalMode',
      \ 'i': 'StatusLineNormalModeItalic',
      \ 'nr': 'StatusLineNormalModeWinNr'
      \ },
    \ 'i': {
      \ 'n': 'StatusLineInsertMode',
      \ 'i': 'StatusLineInsertModeItalic',
      \ 'nr': 'StatusLineInsertModeWinNr'
      \ },
    \ 'v': {
      \ 'n': 'StatusLineVisualMode',
      \ 'i': 'StatusLineVisualModeItalic',
      \ 'nr': 'StatusLineVisualModeWinNr'
      \ },
    \ 'V': {
      \ 'n': 'StatusLineVisualLineMode',
      \ 'i': 'StatusLineVisualLineModeItalic',
      \ 'nr': 'StatusLineVisualLineModeWinNr'
      \ },
    \ '': {
      \ 'n': 'StatusLineVisualBlockMode',
      \ 'i': 'StatusLineVisualBlockModeItalic',
      \ 'nr': 'StatusLineVisualBlockModeWinNr'
      \ },
    \ 'R': {
      \ 'n': 'StatusLineReplaceMode',
      \ 'i': 'StatusLineReplaceModeItalic',
      \ 'nr': 'StatusLineReplaceModeWinNr'
      \ },
    \ 'c': {
      \ 'n': 'StatusLineCommandMode',
      \ 'i': 'StatusLineCommandModeItalic',
      \ 'nr': 'StatusLineCommandModeWinNr'
      \ },
    \ 'r?': {
      \ 'n': 'StatusLineHitEnterPromptMode',
      \ 'i': 'StatusLineHitEnterPromptModeItalic',
      \ 'nr': 'StatusLineHitEnterPromptModeWinNr'
      \ },
    \ }
  let b:hl = 'StatusLineBg'
  let b:hl2 = 'StatusLineBg2c'

  if has_key(b:hls, mode()) == 1
    if &mod
      let b:hl = b:hls[mode()]['i']
    else
      let b:hl = b:hls[mode()]['n']
    endif

    let b:hl2 = b:hls[mode()]['nr']
  endif


  let b:status_line = printf('%%#%s# %d %%#%s# %s ', b:hl2, win_id2win(g:statusline_winid), b:hl, GetFileName())

  let b:status_line .= '%#StatusLineLinNbr# %v%#StatusLineBg2b#:%#StatusLineColNbr#%l%< %#StatusLineBg2b#(%p%% %LL)'
  let b:status_line .= printf('%%=%%#StatusLineBg# %s %s ', LspStatus(), VcsStatus())

  return b:status_line
endfunction

function! MakeInactiveStatusLine()
  let b:hl = 'StatusLineBg2c'
  let b:hlend = 'StatusLineBg'
  let b:status_line = printf(' %d %%#%s# %s %%#%s#', win_id2win(g:statusline_winid), b:hl, GetFileName(), b:hlend)
  return b:status_line
endfunction

au WinEnter,BufEnter * setlocal statusline=%!MakeActiveStatusLine()
au WinLeave,BufLeave * setlocal statusline=%!MakeInactiveStatusLine()
