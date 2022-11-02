--
--    ██████╗░██╗░░██╗░█████╗░░█████╗░███████╗░█████╗░███╗░░██╗░░░██╗░░░░░██╗░░░██╗░█████╗░
--    ██╔══██╗██║░░██║██╔══██╗██╔══██╗╚════██║██╔══██╗████╗░██║░░░██║░░░░░██║░░░██║██╔══██╗
--    ██████╔╝███████║███████║███████║░░███╔═╝██║░░██║██╔██╗██║░░░██║░░░░░██║░░░██║███████║
--    ██╔═══╝░██╔══██║██╔══██║██╔══██║██╔══╝░░██║░░██║██║╚████║░░░██║░░░░░██║░░░██║██╔══██║
--    ██║░░░░░██║░░██║██║░░██║██║░░██║███████╗╚█████╔╝██║░╚███║██╗███████╗╚██████╔╝██║░░██║
--    ╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝░░╚══╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
--                           °.· phaazon’s Neovim configuration ·.°
--
-- The configuration is designed in several sections:
--
-- - First we define better defaults (vim.opt).
-- - We then define a couple global optinons (vim.g).
-- - Some autocommands follow.
-- - We then load some keybindinds.
-- - Packages are then loaded. The list of packages is in lua/pkgs, and each individual
--   package can have their configuration in lua/pkg/<pkg_name>.lua. See the mapping to find
--   the name of the package.
-- - And finally, the home-made statusline.

-- better defaults
local opt = vim.opt
opt.title = true -- report window title
opt.textwidth = 120 -- live the dream
opt.wrap = false -- disable wrapping
opt.hidden = true -- prevent buffers from getting lost when closed
opt.cursorline = true -- show the current line number highlighted for the cursor
opt.termguicolors = true -- how the fuck isn’t that a default?
opt.updatetime = 10 -- time to wait before updating things (typically, gutter / diagnostics)
opt.expandtab = true -- fuck tabs
opt.swapfile = false -- fuck swap files too
opt.tabstop = 2 -- number of spaces to use to show tabs (when others use them…)
opt.mouse = 'nvi' -- mouse support (normal, visual, insert)
opt.showmode = false -- disable show mode, as we use the colorscheme to show it
opt.ruler = true -- show the ruler
opt.inccommand = 'nosplit' -- do not split and show matches when searching
opt.fillchars = 'vert:│' -- various fill chars
opt.timeout = false
opt.timeoutlen = 0
opt.completeopt = 'menuone,noselect' -- completions options
opt.shortmess = 'filmxoOstTIc' -- it really is a mess
opt.number = false -- disable number annotations
opt.shiftwidth = 2 -- indentation level
opt.shiftwidth = 2
opt.ignorecase = true
opt.smartcase = true
opt.virtualedit = 'onemore'
opt.laststatus = 3
opt.foldenable = true
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false

-- a couple of crap; I wish I could move that somewhere else; get rid of it
local g = vim.g
g.rust_recommended_style = 0
g.mapleader = ' '
g.maplocalleader = ','

-- automatically remove line numbers in terminals
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = { '*' },
  callback = function()
    vim.opt.nu = false
  end
})

-- remove trailing whitespaces & highlight yank
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    vim.api.nvim_command [[%s/\s\+$//e]]
  end
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  pattern = { '*' },
  callback = function()
    vim.highlight.on_yank()
  end
})

require 'keybindings'

-- package setup
vim.cmd [[packadd packer.nvim]]
require'packer'.startup(function(use)
  -- Load a package in a smarter way.
  local load_pkg = function(uid, name)
    local ok, pkg_cfg = pcall(require, 'pkg.' .. name)
    if not ok then
      pkg_cfg = {}
    end

    -- init; code that runs before the plugin is loaded
    if not pkg_cfg.disable and pkg_cfg.init ~= nil then
      pkg_cfg.init()
      pkg_cfg.init = nil
    end

    -- extract the keybindings, if any, because this config option is not recognized by packer
    local keybindings = pkg_cfg.keybindings or {}
    pkg_cfg.keybindings = nil

    pkg_cfg = vim.tbl_extend('keep', { uid }, pkg_cfg)


    if not pkg_cfg.disable then
      use(pkg_cfg)

      -- set keybindings
      for mode, bindings in pairs(keybindings) do
        for _, binding in ipairs(bindings) do
          local lhs = binding.key
          local rhs

          if binding.cmd ~= nil then
            rhs = '<cmd>' .. binding.cmd .. '<cr>'
          elseif binding.lua ~= nil then
            local t = type(binding.lua)
            if t == 'string' then
              rhs = ':lua ' .. binding.lua .. '<cr>'
            elseif t == 'function' then
              rhs = binding.lua
            end
          end

          vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
          -- vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
        end
      end
    end
  end

  for uid, name in pairs(require'pkgs') do
    load_pkg(uid, name)
  end
end)

require 'statusline'
