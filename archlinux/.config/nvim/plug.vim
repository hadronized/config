call plug#begin('~/.config/nvim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'phaazon/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tikhomirov/vim-glsl'
Plug 'phaazon/vim-cheddar'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'mzlogin/vim-markdown-toc'
Plug 'ElmCast/elm-vim'
Plug 'raichoo/purescript-vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-startify'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'idris-hackers/idris-vim'
Plug 'rakr/vim-one'
Plug 'posva/vim-vue'
Plug 'pest-parser/pest.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'baskerville/vim-sxhkdrc'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()
filetype plugin indent on
