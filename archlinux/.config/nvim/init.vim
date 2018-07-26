set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'phaazon/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'NLKNguyen/papercolor-theme'
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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'idris-hackers/idris-vim'
Plug 'rakr/vim-one'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

source ~/.config/nvim/nvimrc.bepo

call plug#end()
filetype plugin indent on

scriptencoding utf-8
set encoding=utf8

syntax on
set showmode!
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
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
set autoindent
set laststatus=2
set nu
set wrap!
set autoread
set inccommand=split
set wildignore+=*/target/*
set termguicolors
set fillchars=vert:│
set background=dark
colorscheme one 
hi! Normal ctermbg=NONE guibg=NONE

let mapleader=","

" key bindings
"tnoremap <Esc> <C-\><C-n>
noremap ,b :Buffers<CR>
noremap ,f :Files<CR>
noremap ,t :Tags<CR>
noremap ,n :NERDTreeToggle<CR>
noremap ,gb :Gblame<CR>
noremap ,gc :Commits<CR>
noremap ,gd :GFiles?<CR>
noremap ,gf :GFiles<CR>
noremap ,gt :GitGutterNextHunk<CR>
noremap ,gs :GitGutterPrevHunk<CR>
noremap U :redo<CR>
noremap k :call LanguageClient_textDocument_hover()<CR>
noremap gd :call LanguageClient_textDocument_definition()<CR>
noremap <F2> :call LanguageClient_textDocument_rename()<CR>

if exists('g:gui_oni')
  set smartcase

  " Turn off statusbar, because it is externalized
  set noruler
  set laststatus=0
  set noshowcmd

  unmap ,f
  unmap ,t
  unmap ,n
endif

" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_hls_cursor = 'purple'

" one
let g:one_allow_italics = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified', 'lsp' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"×":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'lsp': '%{LanguageClient_serverStatus()==1?"LS ◐":"LS ●"}'
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

set statusline+=%#warningmsg#
set statusline+=%*

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_disable = 1          " disable Haskell source indentation
let g:haskell_classic_highlighting = 1

" Rust
let $RUST_SRC_PATH = "/usr/local/src/rust/src"
let g:rust_recommended_style = 0 " disable Rust recommended style (it forces 4 spaces indent and shit)

" NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeMapChdir = 'H'
let g:NERDTreeMapChdir = 'hd'
let g:NERDTreeMapCWD = 'HD'
let g:NERDTreeMapOpenInTab = 'j'
let g:NERDTreeMapJumpLastChild = 'J'
let g:NERDTreeMapOpenVSplit = 'k'
let g:NERDTreeMapRefresh = 'l'
let g:NERDTreeMapRefreshRoot = 'L'
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" Rainbow
let g:rainbow_active = 0
let g:rainbow_conf = {
	\	'guifgs': ['#d3869b', '#83a598', '#fabd2f', '#b8bb26', '#fb4934'], 
	\}

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '_'
let g:gitgutter_sign_modified_removed = '≃'

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'haskell': ['hie-wrapper'],
    \ }

" FZF
set rtp+=/usr/local/opt/fzf

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
