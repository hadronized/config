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

hi StatusLineLSPErrors guibg=#23272e guifg=#ff6c6b
hi StatusLineLSPWarnings guibg=#23272e guifg=#ECBE7B
hi StatusLineLSPInformations guibg=#23272e guifg=#51afef
hi StatusLineLSPHints guibg=#23272e guifg=#c678dd

hi StatusLineCurrentSymbolName guibg=#23272e guifg=#c678dd
hi StatusLineCurrentSymbolType guibg=#23272e guifg=#98be65 gui=italic
hi StatusLineCurrentSymbolBracket guibg=#23272e guifg=#5B6268 gui=italic

hi StatusLineNormalMode guibg=#51afef guifg=#23272e
hi StatusLineNormalModeItalic guibg=#51afef guifg=#23272e gui=italic
hi StatusLineInsertMode guibg=#98be65 guifg=#23272e
hi StatusLineInsertModeItalic guibg=#98be65 guifg=#23272e gui=italic
hi StatusLineReplaceMode guibg=#ff6c6b guifg=#23272e
hi StatusLineReplaceModeItalic guibg=#ff6c6b guifg=#23272e gui=italic
hi StatusLineVisualMode guibg=#46D9FF guifg=#23272e
hi StatusLineVisualModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineVisualBlockMode guibg=#46D9FF guifg=#23272e
hi StatusLineVisualBlockModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineVisualLineMode guibg=#46D9FF guifg=#23272e
hi StatusLineVisualLineModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineSelectMode guibg=#46D9FF guifg=#23272e
hi StatusLineSelectModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineSelectLineMode guibg=#46D9FF guifg=#23272e
hi StatusLineSelectLineModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineSelectBlockMode guibg=#46D9FF guifg=#23272e
hi StatusLineSelectBlockModeItalic guibg=#46D9FF guifg=#23272e gui=italic
hi StatusLineCommandMode guibg=#5B6268 guifg=#23272e
hi StatusLineCommandModeItalic guibg=#5B6268 guifg=#23272e gui=italic
hi StatusLineHitEnterPromptMode guibg=#ff6c6b guifg=#23272e
hi StatusLineHitEnterPromptModeItalic guibg=#ff6c6b guifg=#23272e gui=italic

function! VcsStatus()
  let branch = fugitive#head()
  let b:branch_maxwin = 20

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

function! CurrentSymbol()
  let b:sym_name = tagbar#currenttag('%s', '', 'f')
  let b:sym_ty = tagbar#currenttagtype('%s', '')

  " Early return nothing if we’re not in a buffer providing tags
  if strwidth(b:sym_name) == 0 || strwidth(b:sym_ty) == 0
    return ''
  endif

  " Map between symbol types and icons / text
  let b:sym_hi = {
    \ 'function': '%#Function#',
    \ 'macro': '%#Method#',
    \ 'method': '%#Method#',
    \ 'module': '%#Include#',
    \ 'enum': '%#Enum#螺',
    \ 'enum variant': '%#Label#',
    \ 'struct': '%#Struct#',
    \ 'struct field': '%#Label#',
    \ 'implementation': '%#Special#',
    \ 'type alias': '%#Type#',
    \ 'variable': '%#Variable#'
    \}

  if has_key(b:sym_hi, b:sym_ty) == 1
    return printf("%s %s", b:sym_hi[b:sym_ty], b:sym_name)
  else
    return printf("%%#StatusLineCurrentSymbolName#%s %%#StatusLineCurrentSymbolBracket#[%%#StatusLineCurrentSymbolType#%s%%#StatusLineCurrentSymbolBracket#]", b:sym_name, b:sym_ty)
  endif
endfunction

function! MakeActiveStatusLine()
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

  if (winwidth(g:statusline_winid) <= &columns / 2.5)
    " Minimal mode
    let b:status_line .= '%#StatusLineLinNbr# %v%#StatusLineBg2b#:%#StatusLineColNbr#%l %#StatusLineBg2b#(%p%% %LL)'
  else
    let b:status_line .= '%#StatusLineLinNbr# %v%#StatusLineBg2b#:%#StatusLineColNbr#%l %#StatusLineBg2b#(%p%% %LL)'
    let b:status_line .= printf('%%=%%#StatusLineBg#%s %s %s ', CurrentSymbol(), LspStatus(), VcsStatus())
  endif

  return b:status_line
endfunction

function! MakeInactiveStatusLine()
  let b:hl = 'StatusLineBg2c'
  let b:hlend = 'StatusLineBg'
  let b:status_line = printf('%%#%s# %s %%#%s#', b:hl, GetFileName(), b:hlend)
  return b:status_line
endfunction

au WinEnter,BufEnter * setlocal statusline=%!MakeActiveStatusLine()
au WinLeave,BufLeave * setlocal statusline=%!MakeInactiveStatusLine()
