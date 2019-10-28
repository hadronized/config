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

" Productivity
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'Shougo/echodoc.vim'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'jceb/vim-orgmode'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neoclide/coc-sources'
Plug 'tveskag/nvim-blame-line'

" Visual
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'Rigellute/shades-of-purple.vim'

" Other
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()
filetype plugin indent on
