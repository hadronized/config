set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'phaazon/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ajmwagar/vim-deus'
Plug 'ltlollo/diokai'
Plug 'KeitaNakamura/neodark.vim'
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
Plug 'MattesGroeger/vim-bookmarks'
Plug 'luochen1990/rainbow'

source ~/.config/nvim/nvimrc.bepo

call plug#end()
filetype plugin indent on

scriptencoding utf-8
set encoding=utf8

syntax on
set hlsearch
set backspace=indent,eol,start
set nobackup
set dir=/var/tmp
set history=500
set ruler
set showcmd
set incsearch
set noswapfile
set hidden
set colorcolumn=100
set cursorline
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
set autoindent
set laststatus=2
set nu
set autoread
set inccommand=split
set wildignore+=*/target/*

set termguicolors
let g:gruvbox_italic = 1
let g:gruvbox_hls_cursor = 'purple'
set background=dark
colorscheme gruvbox 

let mapleader=","
lmap <S-Space> <ESC>

noremap ,f :CtrlP<CR>
noremap ,t :CtrlPTag<CR>
noremap U :redo<CR>

filetype plugin indent on

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"×":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH="~/dev/rust/src"

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_disable = 1          " disable Haskell source indentation
let g:haskell_classic_highlighting = 1

let g:rust_recommended_style = 0 " disable Rust recommended style (it forces 4 spaces indent and shit)

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

noremap ,n :NERDTreeToggle<CR>
"let NERDTreeMapJumpFirstChild='s'
let g:NERDTreeMapChdir = 'H'
let g:NERDTreeMapChdir = 'hd'
let g:NERDTreeMapCWD = 'HD'
let g:NERDTreeMapOpenInTab = 'j'
let g:NERDTreeMapJumpLastChild = 'J'
let g:NERDTreeMapOpenVSplit = 'k'
let g:NERDTreeMapRefresh = 'l'
let g:NERDTreeMapRefreshRoot = 'L'

noremap ,gt :GitGutterNextHunk<CR>
noremap ,gs :GitGutterPrevHunk<CR>
noremap ,gb :Gblame<CR>

let g:bookmark_sign = ''
let g:bookmark_highlight_lines = 1
let g:bookmark_save_per_working_dir = 1

let g:rainbow_active = 0
let g:rainbow_conf = {
	\	'guifgs': ['#d3869b', '#83a598', '#fabd2f', '#b8bb26', '#fb4934'], 
	\}

au BufWritePost *.hs            silent !init-tags %
au BufWritePost *.hsc           silent !init-tags %

let g:neodark#terminal_transparent=1
let g:neodark#solid_vertsplit = 1
let g:neodark#use_custom_terminal_theme = 1
