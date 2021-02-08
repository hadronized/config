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

-- Open and close folds with TAB in normal mode.
-- vim.api.nvim_set_keymap('n', '<tab>', 'za', silent_noremap_opt)

-- Insert completion.
vim.api.nvim_set_keymap('i', '<c-f>', '<c-x><c-f>', silent_noremap_opt)

-- nvim-completion
vim.api.nvim_set_keymap('i', '<c-space>', "<cmd>lua require'completion'.triggerCompletion()<cr>", silent_opt)

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
vim.api.nvim_set_keymap('n', '<leader>bb', "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Files.
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>fT', "<cmd>lua require('telescope.builtin').filetypes(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- File history.
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Git.
vim.api.nvim_set_keymap('n', '<leader><leader>', "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gb', "<cmd>Git blame<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Git<cr>', silent_noremap_opt)
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
vim.api.nvim_set_keymap('n', '<leader>sb', "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- Quickfix.
vim.api.nvim_set_keymap('n', '<leader>cq', "<cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)

-- LSP.
-- vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('v', '<leader>ca', "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cb', "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>cD', "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown())<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cD', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>ch', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cH', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cl', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>cn', "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cn', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", silent_noremap_opt)
-- vim.api.nvim_set_keymap('n', '<leader>cp', "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cp', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cr', "<cmd>lua require('lspsaga.rename').rename()<CR>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cs', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cS', "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", silent_noremap_opt)
vim.api.nvim_set_keymap('n', '<leader>cx', "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", silent_noremap_opt)

-- Filetree.
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', silent_noremap_opt)

-- Tagbar.
vim.api.nvim_set_keymap('n', '<leader>co', '<cmd>TagbarToggle<CR>', silent_noremap_opt)

-- Journal.
vim.api.nvim_set_keymap('n', '<leader>nj', "<cmd> lua require('notes-local').open_journal()<cr>", silent_noremap_opt)

-- Vroom.
vim.api.nvim_set_keymap('n', 'è', "<cmd>lua require'hop'.jump_words({ keys = 'etovxqpdygfblzhckisuran' })<cr><cr>", silent_noremap_opt)

