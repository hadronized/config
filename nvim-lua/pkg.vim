call plug#begin('~/.cache/nvim/vim-plug')

source ~/.config/nvim/themes.vim

source ~/.config/nvim/auto-pairs.vim
source ~/.config/nvim/better-motions.vim
source ~/.config/nvim/colorizer.vim
source ~/.config/nvim/commentary.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/context.vim
source ~/.config/nvim/devicons.vim
source ~/.config/nvim/easy-align.vim
source ~/.config/nvim/echodoc.vim
source ~/.config/nvim/filetree.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/git.vim
source ~/.config/nvim/glsl.vim
source ~/.config/nvim/idris.vim
source ~/.config/nvim/better-lua.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/rust.vim
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/surround.vim
source ~/.config/nvim/tagbar.vim
source ~/.config/nvim/ctags.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/which-key.vim

call plug#end()

" Run some lua code
" lua require('statusline-local')
lua require('colorizer-local')
lua require('lsp-local')
lua require('telescope-local')
lua require('treesitter-local')

" TODO: Move this somewhere else
lua RELOAD = require'plenary.reload'.reload_module

lua require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }
