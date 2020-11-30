-- Global and mode keybindings.

local silent_noremap_opt = { silent = true, noremap = true }
local silent_opt = { silent = true }

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
vim.api.nvim_set_keymap('', 'J', 'T', silent_noremap_opt)
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

-- Better C-n / C-p
vim.api.nvim_set_keymap('', '<c-t>', '<c-n>', silent_noremap_opt)
vim.api.nvim_set_keymap('i', '<c-t>', '<c-n>', silent_noremap_opt)
vim.api.nvim_set_keymap('', '<c-s>', '<c-p>', silent_noremap_opt)
vim.api.nvim_set_keymap('i', '<c-s>', '<c-p>', silent_noremap_opt)

-- Insert completion.
vim.api.nvim_set_keymap('i', '<c-f>', '<c-x><c-f>', silent_noremap_opt)

-- nvim-completion
vim.api.nvim_set_keymap('i', '<c-space>', "<cmd>lua require'completion'.triggerCompletion()<cr>", silent_opt)

-- Quick access to common files.
vim.api.nvim_set_keymap('n', '<leader>fci', '<cmd>edit ~/.config/nvim/init.vim<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fck', '<cmd>edit ~/.config/nvim/lua/keybindings-local.lua<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fcp', '<cmd>edit ~/.config/nvim/pkg.vim<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fcz', '<cmd>edit ~/.zshrc<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fcZ', '<cmd>edit ~/.zprofile<cr>', silent_noremap_opt)

-- Buffer and tabs.
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>bdel<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bD', '<cmd>bdel!<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bn', '<cmd>new<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bN', '<cmd>tabnew<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bv', '<cmd>vnew<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>tabp<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>br', '<cmd>tabn<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bs', '<cmd>w<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>bS', '<cmd>w!<cr>', silent_noremap_opt)

-- Buffers.
vim.api.nvim_set_keymap('n', '<leader>bb', "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Files.
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- File history.
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Commentary.
vim.api.nvim_set_keymap('n', '<leader>/', '<Plug>CommentaryLine', {})
vim.api.nvim_set_keymap('x', '<leader>/', '<Plug>Commentary', {})

-- Git.
vim.api.nvim_set_keymap('n', '<leader><leader>', "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Git<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gw', '<cmd>Gwrite<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>GitGutterQuickFix<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gh', '<cmd>GitGutterPreviewHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gn', '<cmd>GitGutterNextHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>GitGutterPrevHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>GitGutterPrevHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>GitGutterStageHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gx', '<cmd>GitGutterUndoHunk<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gz', '<cmd>GitGutterFold<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gB', "<cmd>Git branch<cr>", silent_noremap_opt)

-- Context.
vim.api.nvim_set_keymap('n', '<leader>cct', '<cmd>ContextToggle<cr>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ccp', '<cmd>ContextPeek<cr>', silent_noremap_opt)

-- Filetypes.
vim.api.nvim_set_keymap('n', '<leader>tf', "<cmd>lua require('telescope.builtin').filetypes(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Search.
vim.api.nvim_set_keymap('n', '<leader>sb', "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Quickfix.
vim.api.nvim_set_keymap('n', '<leader>cq', "<cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- LSP.
vim.api.nvim_set_keymap('n', 'S', '<cmd>lua vim.lsp.buf.hover()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cD', "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown())<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cs', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cS', "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Filetree.
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>LuaTreeToggle<CR>', silent_noremap_opt)

-- Tagbar.
vim.api.nvim_set_keymap('n', '<leader>co', '<cmd>TagbarToggle<CR>', silent_noremap_opt)
