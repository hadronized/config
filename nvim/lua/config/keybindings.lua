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
remap('n', '<leader>bb', '<cmd>Telescope buffers<cr>')

-- Files.
remap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
remap('n', '<leader>fT', '<cmd>Telescope filetypes<cr>')

-- File history.
remap('n', '<leader>fh', '<cmd>Telescope oldfiles<cr>')

-- Git.
remap('n', '<leader><leader>', '<cmd>Telescope git_files<cr>')
remap('n', '<leader>gb', "<cmd>Telescope git_branches<cr>")
remap('n', '<leader>gB', "<cmd>Git blame<cr>")
remap('n', '<leader>gc', '<cmd>Commits<cr>')
remap('n', '<leader>gg', "<cmd>Git<cr>")
remap('n', '<leader>gS', '<cmd>Gwrite<cr>')
remap('n', '<leader>gtl', '<cmd>Gitsigns toggle_linehl<cr>')
remap('n', '<leader>gtw', '<cmd>Gitsigns toggle_word_diff<cr>')

-- Search.
remap('n', '<leader>sc', '<cmd>Telescope command_history<cr>')
remap('n', '<leader>sm', '<cmd>Telescope marks<cr>')
remap('n', '<leader>sp', '<cmd>Telescope live_grep<cr>')
remap('n', '<leader>sr', '<cmd>Telescope registers<cr>')
remap('n', '<leader>ss', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- Quickfix.
remap('n', '<leader>cq', '<cmd>Telescope quickfix<cr>')

-- Tags.
remap('n', '<leader>cT', '<cmd>Telescope tags<CR>')
remap('n', 'gd', '<C-]>')

-- Test.
remap('n', '<leader>ta', '<cmd>Ultest<cr>')
remap('n', '<leader>tn', '<cmd>UltestNearest<cr>')
remap('n', '<leader>ts', '<cmd>UltestStop<cr>')
remap('n', '<leader>tt', '<cmd>UltestSummary<cr>')

-- Filetree.
remap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>')

-- Org & notes.
remap('n', '<leader>nn', "<cmd>lua require'mind'.open_node()<cr>")
remap('n', '<leader>na', "<cmd>lua require'mind'.create_node()<cr>")

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
