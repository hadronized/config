local M = {}

function M.create_highlights()
  local function set_hl(group, tbl)
    vim.api.nvim_set_hl(0, group, tbl)
  end

  set_hl('StatusLineBg', { link = 'Statusline' })
  set_hl('StatusLineDeli', { link = 'Statusline' })
  set_hl('StatusLineLineNb', { link = 'Statusline' })
  set_hl('StatusLineColNb', { link = 'Statusline' })
  set_hl('StatusLinePercent', { link = 'Statusline' })
  set_hl('StatusLineCount', { link = 'Statusline' })
  set_hl('StatusLineGitBranchSymbol', { link = 'Statusline' })
  set_hl('StatusLineGitBranchName', { link = 'Statusline' })
  set_hl('StatusLineGitDiffNone', { link = 'Statusline' })
  set_hl('StatusLineGitDiffAdd', { link = 'Statusline' })
  set_hl('StatusLineGitDiffMod', { link = 'Statusline' })
  set_hl('StatusLineGitDifDel', { link = 'Statusline' })
  set_hl('StatusLineNormalMode', { link = 'Statusline' })
  set_hl('StatusLineInsertMode', { link = 'Statusline' })
  set_hl('StatusLineReplaceMode', { link = 'Statusline' })
  set_hl('StatusLineVisualMode', { link = 'Statusline' })
  set_hl('StatusLineSelectMode', { link = 'Statusline' })
  set_hl('StatusLineSelectLineMode', { link = 'Statusline' })
  set_hl('StatusLineSelectBlockMode', { link = 'Statusline' })
  set_hl('StatusLineCommandMode', { link = 'Statusline' })
  set_hl('StatusLineHitEnterPromptMode', { link = 'Statusline'})
end

vim.api.nvim_command('augroup phaazon')
vim.api.nvim_command('  au!')
vim.api.nvim_command([[  au ColorScheme * lua require'statusline'.create_highlights()]])
vim.api.nvim_command('augroup END')

local function vcs_status()
  local dict = vim.b.gitsigns_status_dict

  if dict == nil then
    return ''
  end

  if dict.head == nil then
    return ''
  end

  local ahl, mhl, rhl
  local added, changed, removed = 0, 0, 0

  if dict.added ~= nil and dict.added > 0 then
    ahl = '%#StatusLineGitDiffAdd#'
    added = dict.added
  else
    ahl = '%#StatusLineGitDiffNone#'
  end

  if dict.changed ~= nil and dict.changed > 0 then
    mhl = '%#StatusLineGitDiffMod#'
    changed = dict.changed
  else
    mhl = '%#StatusLineGitDiffNone#'
  end

  if dict.removed ~= nil and dict.removed > 0 then
    rhl = '%#StatusLineGitDiffDel#'
    removed = dict.removed
  else
    rhl = '%#StatusLineGitDiffNone#'
  end

  return string.format('%s %i %s %i %s %i %%#StatusLineGitBranchSymbol# %%#StatusLineGitBranchName#%s ',
    ahl,
    added,
    mhl,
    changed,
    rhl,
    removed,
   dict.head:gsub('%s+', '')
  )
end

local function lsp_breadcrumbs()
  local navic = require'nvim-navic'
  if navic == nil or not navic.is_available() then
    return ''
  end

  return navic.get_location()
end

local function get_file_name(modified)
  local max_width = vim.fn.winwidth(vim.g.statusline_winid) * 0.25
  local file_name = vim.fn.fnamemodify(vim.fn.bufname(vim.fn.winbufnr(vim.g.statusline_winid)), ':.')
  local width = vim.fn.strwidth(file_name)

  if width == 0 then
    file_name = '[scratch]'
  else
    -- If the file name is too big, we just write its tail part
    if width > max_width then
      file_name = vim.fn.fnamemodify(file_name, ':t')
    end

    local devicons = require'nvim-web-devicons'
    if devicons ~= nil then
      local ext = vim.fn.fnamemodify(file_name, ':e')
      local icon = devicons.get_icon(file_name, ext)

      if icon ~= nil then
        file_name = string.format('%s %s', icon, file_name)
      end
    end
  end

  if modified then
    return file_name .. ' '
  else
    return file_name
  end
end

local function make_active_status_line()
  local hls = {
    n = 'StatusLineNormalMode',
    no = 'StatusLineReplaceMode',
    nov = 'StatusLineReplaceMode',
    ['noV'] = 'StatusLineReplaceMode',
    ['no'] = 'StatusLineReplaceMode',
    i = 'StatusLineInsertMode',
    ic = 'StatusLineInsertMode',
    ix = 'StatusLineInsertMode',
    ['niI'] = 'StatusLineInsertMode',
    v = 'StatusLineVisualMode',
    V = 'StatusLineVisualMode',
    [''] = 'StatusLineVisualMode',
    ['niV'] = 'StatusLineVisualMode',
    s = 'StatusLineVisualMode',
    S = 'StatusLineVisualMode',
    [''] = 'StatusLineVisualMode',
    R = 'StatusLineReplaceMode',
    Rc = 'StatusLineReplaceMode',
    Rv = 'StatusLineReplaceMode',
    Rx = 'StatusLineReplaceMode',
    ['niR'] = 'StatusLineReplaceMode',
    c = 'StatusLineCommandMode',
    cv = 'StatusLineCommandMode',
    ce = 'StatusLineCommandMode',
    r = 'StatusLineHitEnterPromptMode',
    rm = 'StatusLineHitEnterPromptMode',
    ['r?'] = 'StatusLineHitEnterPromptMode',
    ['!'] = 'StatusLineHitEnterPromptMode',
    t = 'StatusLineReplaceMode',
  }

  local hl = 'StatusLineBg'

  local mode = vim.fn.mode()
  if vim.fn.has_key(hls, mode) then
    hl = hls[mode]
  end

  local status_line = string.format('%%#%s# %s %%#StatusLineBg# ',
    hl,
    get_file_name(vim.bo.mod)
  )
  status_line = status_line .. lsp_breadcrumbs()
  status_line = status_line .. '%='
  status_line = status_line .. ' %#StatusLineDeli#L:%#StatusLineColNb#%l %#StatusLineDeli#C:%#StatusLineLineNb#%v%< %#StatusLineDeli#(%#StatusLinePercent#%p%% %#StatusLineCount#%LL%#StatusLineDeli#) '
  status_line = status_line .. '%Y ' .. vcs_status()

  return status_line
end

local function make_inactive_status_line()
  local hlend = 'StatusLineBg'
  local status_line = string.format(' %s %%#%s#',
    get_file_name(),
    hlend
  )

  return status_line
end

function M.make_status_line()
  vim.wo.statusline = '%!v:lua.active_status_line()'
end

local function create_au()
  vim.api.nvim_command("au BufEnter * lua require'statusline'.make_status_line()")
end

create_au()

M.make_status_line()

_G.active_status_line = make_active_status_line
_G.inactive_status_line = make_inactive_status_line
_G.lsp_breadcrumbs = lsp_breadcrumbs

return M
