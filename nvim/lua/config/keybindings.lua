vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local function remap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
end

local function remap_expr(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { expr = true })
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

-- Better C-n / C-p
remap('', '<c-t>', '<c-n>')
remap('i', '<c-t>', '<c-n>')
remap('', '<c-s>', '<c-p>')
remap('i', '<c-s>', '<c-p>')

-- Insert completion.
remap('i', '<c-f>', '<c-x><c-f>')

-- Quick access to common files.
remap('n', '<leader>fci', '<cmd>edit ~/.config/nvim/init.lua<cr>')
remap('n', '<leader>fck', '<cmd>edit ~/.config/nvim/lua/config/keybindings.lua<cr>')
remap('n', '<leader>fcl', '<cmd>edit ~/.config/nvim/lua/config/lsp.lua<cr>')
remap('n', '<leader>fcp', '<cmd>edit ~/.config/nvim/lua/config/pkg.lua<cr>')
remap('n', '<leader>fcv', '<cmd>edit ~/.config/nvim/lua/config/vim.lua<cr>')

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
remap('n', '<leader>bb', '<cmd>Telescope buffers theme=get_ivy previewer=false<cr>')
-- remap('n', '<leader>bb', '<cmd>Buffers<cr>')

-- Files.
remap('n', '<leader>ff', '<cmd>Telescope find_files theme=get_ivy previewer=false<cr>')
remap('n', '<leader>fT', '<cmd>Telescope filetypes theme=get_ivy previewer=false<cr>')
-- remap('n', '<leader>ff', '<cmd>Files<cr>')
-- remap('n', '<leader>fT', '<cmd>Filetypes<cr>')

-- File history.
remap('n', '<leader>fh', '<cmd>Telescope oldfiles theme=get_ivy previewer=false<cr>')
-- remap('n', '<leader>fh', '<cmd>History<cr>')

-- Git.
remap('n', '<leader><leader>', '<cmd>Telescope git_files theme=get_ivy previewer=false<cr>')
remap('n', '<leader>gb', "<cmd>Telescope git_branches theme=get_ivy previewer=false<cr>")
remap('n', '<leader>gB', "<cmd>Git blame<cr>")
remap('n', '<leader>gc', '<cmd>Commits<cr>')
remap('n', '<leader>gg', "<cmd>Neogit<cr>")
remap('n', '<leader>gS', '<cmd>Gwrite<cr>')

-- Search.
remap('n', '<leader>sc', '<cmd>Telescope command_history theme=get_ivy<cr>')
remap('n', '<leader>sm', '<cmd>Telescope marks theme=get_ivy<cr>')
remap('n', '<leader>sp', '<cmd>Telescope live_grep theme=get_ivy<cr>')
remap('n', '<leader>sr', '<cmd>Telescope registers theme=get_ivy<cr>')
remap('n', '<leader>ss', '<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<cr>')
-- remap('n', '<leader>sb', '<cmd>BLines<cr>')
-- remap('n', '<leader>sc', '<cmd>Commands<cr>')
-- remap('n', '<leader>sm', '<cmd>Marks<cr>')
-- remap('n', '<leader>sr', '<cmd>Registers<cr>')
-- remap('n', '<leader>ss', '<cmd>Rg<cr>')

-- Quickfix.
remap('n', '<leader>cq', '<cmd>Telescope quickfix theme=get_ivy<cr>')

-- Tags.
remap('n', '<leader>cT', '<cmd>Telescope tags theme=get_ivy<CR>')
-- remap('n', '<leader>cT', '<cmd>Tags<CR>')
remap('n', 'gd', '<C-]>')

-- Test.
remap('n', '<leader>ta', '<cmd>Ultest<cr>')
remap('n', '<leader>tn', '<cmd>UltestNearest<cr>')
remap('n', '<leader>ts', '<cmd>UltestStop<cr>')
remap('n', '<leader>tt', '<cmd>UltestSummary<cr>')

-- Filetree.
remap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>')

-- Org & notes.
remap('n', '<leader>nj', "<cmd>lua require('notes-local').open_journal()<cr>")
-- remap('n', '<leader>nt', "<cmd>lua require('notes-local').open_todo()<cr>")
-- remap('n', '<leader>ns', "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find({ default_text = '^# [ ]' })<cr>")
-- remap('n', '<leader>nS', "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find({ default_text = '^# [·]' })<cr>")

--  Hop.
remap('', 'è', '<cmd>HopWord<cr>')
remap('', 'È', '<cmd>HopChar1<cr>')
remap('', '<C-l>', '<cmd>HopLineStart<cr>')
remap('', '<leader>/', '<cmd>HopPattern<cr>')

-- Plugins.
remap('n', '<leader>pc', '<cmd>PackerClean<cr>')
remap('n', '<leader>pC', '<cmd>PackerCompile<cr>')
remap('n', '<leader>pi', '<cmd>PackerInstall<cr>')
remap('n', '<leader>ps', '<cmd>PackerStatus<cr>')
remap('n', '<leader>pS', '<cmd>PackerSync<cr>')
remap('n', '<leader>pu', '<cmd>PackerUpdate<cr>')

-- Terminal.
-- remap('t', '<esc>', '<c-\\><c-n>')

-- See highlight at point.
remap('n', '<leader>$', '<cmd>call SyntaxAttr()<cr>')
