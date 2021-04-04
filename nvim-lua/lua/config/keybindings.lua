vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local function remap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end

-- Bépo.
remap('', 'é', 'w')
remap('', 'É', 'W')
remap('', 'w', '<C-w>')
remap('', 'c', 'h')
remap('', 'r', 'l')
remap('', 't', 'j')
remap('', 's', 'k')
remap('', 'C', 'H')
remap('', 'R', 'L')
remap('', 'T', 'J')
remap('', 'S', 'K')
remap('', 'zs', 'zj')
remap('', 'zt', 'zk')
remap('', 'j', 't')
remap('', 'à', 't')
remap('', 'J', 'T')
remap('', 'À', 'T')
remap('', 'l', 'c')
remap('', 'L', 'C')
remap('', 'h', 'r')
remap('', 'H', 'R')
remap('', 'k', 's')
remap('', 'K', 'S')
remap('', ']k', ']s')
remap('', '[k', '[s')
remap('', 'gs', 'gk')
remap('', 'gt', 'gj')
remap('', '«', '<')
remap('', '»', '>')
remap('', 'wt', '<C-w>j')
remap('', 'ws', '<C-w>k')
remap('', 'wc', '<C-w>h')
remap('', 'wr', '<C-w>l')
remap('', 'wd', '<C-w>c')
remap('', 'wo', '<C-w>s')
remap('', 'wp', '<C-w>o')
remap('i', ' ', ' ')

-- Move to a window by using its window number.
for i = 1, 9 do
  remap('n', 'w' .. i, i .. '<C-w><C-w>')
end

-- Redo.
remap('n', 'U', '<cmd>redo<cr>')

-- Move lines up and down.
remap('n', 'S', '<cmd>m .-2<cr>')
remap('n', 'T', '<cmd>m .+1<cr>')

-- Better C-n / C-p
remap('', '<c-t>', '<c-n>')
remap('i', '<c-t>', '<c-n>')
remap('', '<c-s>', '<c-p>')
remap('i', '<c-s>', '<c-p>')

-- Insert completion.
remap('i', '<c-f>', '<c-x><c-f>')

-- nvim-compe
remap('i', '<c-space>', 'compe#complete()', silent_expr_opt)
remap('i', '<cr>', "compe#confirm('<CR>')", silent_expr_opt)

-- Quick access to common files.
remap('n', '<leader>fcc', '<cmd>edit ~/.config/nvim/common.vim<cr>')
remap('n', '<leader>fci', '<cmd>edit ~/.config/nvim/init.vim<cr>')
remap('n', '<leader>fck', '<cmd>edit ~/.config/nvim/lua/keybindings-local.lua<cr>')
remap('n', '<leader>fcl', '<cmd>edit ~/.config/nvim/lua/lsp-local.lua<cr>')
remap('n', '<leader>fcp', '<cmd>edit ~/.config/nvim/pkg.vim<cr>')
remap('n', '<leader>fct', '<cmd>edit ~/.config/nvim/themes.vim<cr>')

-- Buffer and tabs.
remap('n', '<leader>bd', '<cmd>bdel<cr>')
remap('n', '<leader>bD', '<cmd>bdel!<cr>')
remap('n', '<leader>bn', '<cmd>new<cr>')
remap('n', '<leader>bv', '<cmd>vnew<cr>')
remap('n', '<leader>bc', '<cmd>tabp<cr>')
remap('n', '<leader>br', '<cmd>tabn<cr>')
remap('n', '<leader>bs', '<cmd>w<cr>')
remap('n', '<leader>bS', '<cmd>w!<cr>')
remap('n', '<leader>bt', '<cmd>tabnew<cr>')

-- Buffers.
remap('n', '<leader>bb', '<cmd>Telescope buffers previewer=false<cr>')
-- remap('n', '<leader>bb', '<cmd>Buffers<cr>')

-- Files.
remap('n', '<leader>ff', '<cmd>Telescope find_files previewer=false<cr>')
remap('n', '<leader>fT', '<cmd>Telescope filetypes theme=get_dropdown previewer=false<cr>')
-- remap('n', '<leader>ff', '<cmd>Files<cr>')
-- remap('n', '<leader>fT', '<cmd>Filetypes<cr>')

-- File history.
remap('n', '<leader>fh', '<cmd>Telescope oldfiles previewer=false<cr>')
-- remap('n', '<leader>fh', '<cmd>History<cr>')

-- Git.
remap('n', '<leader><leader>', '<cmd>Telescope git_files previewer=false<cr>')
-- remap('n', '<leader><leader>', '<cmd>GFiles<cr>')
remap('n', '<leader>gb', "<cmd>Git blame<cr>")
remap('n', '<leader>gc', '<cmd>Commits<cr>')
remap('n', '<leader>gg', "<cmd>Gstatus<cr>")
remap('n', '<leader>gh', '<cmd>GitGutterPreviewHunk<cr>')
remap('n', '<leader>gn', '<cmd>GitGutterNextHunk<cr>')
remap('n', '<leader>gp', '<cmd>GitGutterPrevHunk<cr>')
remap('n', '<leader>gs', '<cmd>GitGutterStageHunk<cr>')
remap('n', '<leader>gS', '<cmd>Gwrite<cr>')
remap('n', '<leader>gx', '<cmd>GitGutterUndoHunk<cr>')
remap('n', '<leader>gz', '<cmd>GitGutterFold<cr>')

-- Context.
remap('n', '<leader>Cp', '<cmd>ContextPeek<cr>')
remap('n', '<leader>Ct', '<cmd>ContextToggle<cr>')

-- Search.
remap('n', '<leader>sc', '<cmd>Telescope command_history theme=get_dropdown<cr>')
remap('n', '<leader>sm', '<cmd>Telescope marks<cr>')
remap('n', '<leader>sp', '<cmd>Telescope live_grep<cr>')
remap('n', '<leader>sr', '<cmd>Telescope registers theme=get_dropdown<cr>')
remap('n', '<leader>ss', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
-- remap('n', '<leader>sb', '<cmd>BLines<cr>')
-- remap('n', '<leader>sc', '<cmd>Commands<cr>')
-- remap('n', '<leader>sm', '<cmd>Marks<cr>')
-- remap('n', '<leader>sr', '<cmd>Registers<cr>')
-- remap('n', '<leader>ss', '<cmd>Rg<cr>')

-- Quickfix.
remap('n', '<leader>cq', '<cmd>Telescope quickfix<cr>')

-- Tags.
remap('n', '<leader>cT', '<cmd>Telescope tags<CR>')
-- remap('n', '<leader>cT', '<cmd>Tags<CR>')
remap('n', 'gd', '<C-]>')

-- Test.
remap('n', '<leader>ta', '<cmd>Ultest<cr>')
remap('n', '<leader>tn', '<cmd>UltestNearest<cr>')
remap('n', '<leader>ts', '<cmd>UltestStop<cr>')
remap('n', '<leader>tt', '<cmd>UltestSummary<cr>')

-- Filetree.
remap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>')

-- Tagbar.
remap('n', '<leader>co', '<cmd>TagbarToggle<CR>')

-- Org
-- remap('n', '<leader>nj', "<cmd> lua require('notes-local').open_journal()<cr>")
remap('n', '<leader>nt', '<cmd>edit ~/org/todo.org<cr>')

--  Hop.
remap('', 'è', '<cmd>HopWord<cr>')
remap('', 'È', '<cmd>HopChar1<cr>')
remap('', '<C-l>', '<cmd>HopLine<cr>')
remap('', '<leader>/', '<cmd>HopPattern<cr>')

-- Plugins.
remap('n', '<leader>pc', '<cmd>PlugClean<cr>')
remap('n', '<leader>pi', '<cmd>PlugInstall<cr>')
remap('n', '<leader>pu', '<cmd>PlugUpdate<cr>')
remap('n', '<leader>pU', '<cmd>PlugUpgrade<cr>')

-- Snippets.
remap('i', '<tab>', "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>")

-- Terminal.
-- remap('t', '<esc>', '<c-\\><c-n>')
