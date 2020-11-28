" Set some common things.
source ~/.config/nvim/common.vim

" Load packages.
source ~/.config/nvim/pkg.vim

" Pick a colorscheme and override some things if needed.
source ~/.config/nvim/colorscheme.vim

" Load various lua settings.
lua require('keybindings-local')
