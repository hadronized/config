-- Global and mode keybindings.

local silent_noremap_opt = { silent = true, noremap = true }
local silent_expr_opt = { silent = true, expr = true }

-- Bépo.
vim.api.nvim_set_keymap('', 'é', 'w', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'É', 'W', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'w', '<C-w>', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'W', '<C-w><C-w>', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'c', 'h', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'r', 'l', silent_noremap_opt)
vim.api.nvim_set_keymap('', 't', 'j', silent_noremap_opt)
vim.api.nvim_set_keymap('', 's', 'k', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'C', 'H', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'R', 'L', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'T', 'J', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'S', 'K', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'zs', 'zj', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'zt', 'zk', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'j', 't', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'à', 't', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'J', 'T', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'À', 'T', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'l', 'c', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'L', 'C', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'h', 'r', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'H', 'R', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'k', 's', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'K', 'S', silent_noremap_opt)
vim.api.nvim_set_keymap('', ']k', ']s', silent_noremap_opt)
vim.api.nvim_set_keymap('', '[k', '[s', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'gs', 'gk', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'gt', 'gj', silent_noremap_opt)
vim.api.nvim_set_keymap('', '«', '<', silent_noremap_opt)
vim.api.nvim_set_keymap('', '»', '>', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'wt', '<C-w>j', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'ws', '<C-w>k', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'wc', '<C-w>h', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'wr', '<C-w>l', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'wd', '<C-w>c', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'wo', '<C-w>s', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'wp', '<C-w>o', silent_noremap_opt)
vim.api.nvim_set_keymap('i', ' ', ' ', silent_noremap_opt)

-- Move to a window by using its window number.
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', 'w' .. i, i .. '<C-w><C-w>', silent_noremap_opt)
end

-- Redo.
vim.api.nvim_set_keymap('n', 'U', '<cmd>redo<cr>', silent_noremap_opt)

-- Move lines up and down.
vim.api.nvim_set_keymap('n', 'S', '<cmd>m .-2<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', 'T', '<cmd>m .+1<cr>', silent_noremap_opt)

-- Better C-n / C-p
vim.api.nvim_set_keymap('', '<c-t>', '<c-n>', silent_noremap_opt)
vim.api.nvim_set_keymap('i', '<c-t>', '<c-n>', silent_noremap_opt)
vim.api.nvim_set_keymap('', '<c-s>', '<c-p>', silent_noremap_opt)
vim.api.nvim_set_keymap('i', '<c-s>', '<c-p>', silent_noremap_opt)

-- Insert completion.
vim.api.nvim_set_keymap('i', '<c-f>', '<c-x><c-f>', silent_noremap_opt)

-- nvim-compe
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', silent_expr_opt)
vim.api.nvim_set_keymap('i', '<cr>', "compe#confirm('<CR>')", silent_expr_opt)

-- Quick access to common files.
vim.api.nvim_set_keymap('n', '<leader>fcc', '<cmd>edit ~/.config/nvim/common.vim<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fci', '<cmd>edit ~/.config/nvim/init.vim<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fck', '<cmd>edit ~/.config/nvim/lua/keybindings-local.lua<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fcl', '<cmd>edit ~/.config/nvim/lua/lsp-local.lua<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fcp', '<cmd>edit ~/.config/nvim/pkg.vim<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fct', '<cmd>edit ~/.config/nvim/themes.vim<cr>', silent_noremap_opt)

-- Buffer and tabs.
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>bdel<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bD', '<cmd>bdel!<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bn', '<cmd>new<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bv', '<cmd>vnew<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>tabp<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>br', '<cmd>tabn<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bs', '<cmd>w<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bS', '<cmd>w!<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bt', '<cmd>tabnew<cr>', silent_noremap_opt)

-- Buffers.
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Telescope buffers theme=get_dropdown previewer=false<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Buffers<cr>', silent_noremap_opt)

-- Files.
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files theme=get_dropdown previewer=false<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fT', '<cmd>Telescope filetypes theme=get_dropdown previewer=false<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Files<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>fT', '<cmd>Filetypes<cr>', silent_noremap_opt)

-- File history.
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope oldfiles theme=get_dropdown previewer=false<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>History<cr>', silent_noremap_opt)

-- Git.
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>Telescope git_files theme=get_dropdown previewer=false<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>GFiles<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gb', "<cmd>Git blame<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Commits<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gg', "<cmd>Gstatus<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gh', '<cmd>GitGutterPreviewHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gn', '<cmd>GitGutterNextHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>GitGutterPrevHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>GitGutterStageHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gS', '<cmd>Gwrite<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gx', '<cmd>GitGutterUndoHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gz', '<cmd>GitGutterFold<cr>', silent_noremap_opt)

-- Context.
vim.api.nvim_set_keymap('n', '<leader>Cp', '<cmd>ContextPeek<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>Ct', '<cmd>ContextToggle<cr>', silent_noremap_opt)

-- Search.
vim.api.nvim_set_keymap('n', '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>sc', '<cmd>Telescope command_history theme=get_dropdown<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>sm', '<cmd>Telescope marks<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>Telescope registers theme=get_dropdown<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>Telescope live_grep<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>sb', '<cmd>BLines<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>sc', '<cmd>Commands<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>sm', '<cmd>Marks<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>Registers<cr>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>Rg<cr>', silent_noremap_opt)

-- Quickfix.
vim.api.nvim_set_keymap('n', '<leader>cq', '<cmd>Telescope quickfix<cr>', silent_noremap_opt)

-- Tags.
vim.api.nvim_set_keymap('n', '<leader>cT', '<cmd>Telescope tags<CR>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>cT', '<cmd>Tags<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', 'gd', '<C-]>', silent_noremap_opt)

-- Test.
vim.api.nvim_set_keymap('n', '<leader>ta', '<cmd>Ultest<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>UltestNearest<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>UltestStop<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>UltestSummary<cr>', silent_noremap_opt)

-- Filetree.
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', silent_noremap_opt)

-- Tagbar.
vim.api.nvim_set_keymap('n', '<leader>co', '<cmd>TagbarToggle<CR>', silent_noremap_opt)

-- Journal.
vim.api.nvim_set_keymap('n', '<leader>nj', "<cmd> lua require('notes-local').open_journal()<cr>", silent_noremap_opt)

--  Hop.
vim.api.nvim_set_keymap('', 'è', '<cmd>HopWord<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('', 'È', '<cmd>HopChar1<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('', '<C-l>', '<cmd>HopLine<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('', '<leader>/', '<cmd>HopPattern<cr>', silent_noremap_opt)

-- Plugins.
vim.api.nvim_set_keymap('n', '<leader>pc', '<cmd>PlugClean<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>pi', '<cmd>PlugInstall<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>pu', '<cmd>PlugUpdate<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>pU', '<cmd>PlugUpgrade<cr>', silent_noremap_opt)

-- Snippets.
vim.api.nvim_set_keymap('i', '<tab>', "<cmd>lua return require'snippets'.expand_or_advance(1)<CR>", silent_noremap_opt)

-- Terminal.
vim.api.nvim_set_keymap('t', '<esc>', '<c-\\><c-n>', silent_noremap_opt)
