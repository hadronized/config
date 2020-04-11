call plug#begin('~/.config/nvim/plugged')

" Syntax support
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'phaazon/vim-cheddar'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'ElmCast/elm-vim'
Plug 'raichoo/purescript-vim'
Plug 'idris-hackers/idris-vim'
Plug 'posva/vim-vue'
Plug 'pest-parser/pest.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'baskerville/vim-sxhkdrc'
Plug 'r0mai/vim-djinni'
Plug 'kelan/gyp.vim'
Plug 'ap/vim-css-color'

" Productivity
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" git-messenger
Plug 'rhysd/git-messenger.vim'
let g:git_messenger_no_default_mappings = v:true

Plug 'junegunn/fzf.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'machakann/vim-highlightedyank'
Plug 'tveskag/nvim-blame-line'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vimwiki/vimwiki'

" commantary
Plug 'tpope/vim-commentary'

" Visual
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'sainnhe/edge'

" Other
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" which-key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

call plug#end()
filetype plugin indent on
