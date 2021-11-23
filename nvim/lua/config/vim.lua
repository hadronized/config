local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

o.title = true -- report window title
o.textwidth = 120 -- live the dream
o.wrap = false -- disable wrapping
o.hidden = true -- prevent buffers from getting lost when closed
o.cursorline = true -- show the current line number highlighted for the cursor
o.termguicolors = true -- how the fuck isn’t that a default?
o.updatetime = 10 -- time to wait before updating things (typically, gutter / diagnostics)
o.expandtab = true -- fuck tabs
o.swapfile = false -- fuck swap files too
o.tabstop = 2 -- number of spaces to use to show tabs (when others use them…)
o.mouse = 'nvi' -- mouse support (normal, visual, insert)
o.showmode = false -- disable show mode, as we use the colorscheme to show it
o.ruler = true -- show the ruler
o.inccommand = 'nosplit' -- do not split and show matches when searching
o.fillchars = 'vert:│' -- various fill chars
o.timeout = false
o.timeoutlen = 9999999
o.completeopt = 'menuone,noselect' -- completions options
o.shortmess = 'filmxoOstTIc' -- it really is a mess
wo.number = true -- enable number annotations
bo.shiftwidth = 2 -- indentation level
o.shiftwidth = 2
o.ignorecase = true
o.smartcase = true
o.virtualedit = 'onemore'

-- remove trailing whitespaces & highlight yank
vim.api.nvim_command([[au BufWritePre * %s/\s\+$//e]])
vim.api.nvim_command([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

g.rust_recommended_style = 0
