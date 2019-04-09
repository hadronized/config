set nocompatible
filetype off

let g:ale_completion_enabled = 1

source ~/.config/nvim/plug.vim
source ~/.config/nvim/nvimrc.bepo
source ~/.config/nvim/platform-specific.vim
source ~/.config/nvim/key_bindings.vim

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
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set autoindent
set laststatus=2
set nu
set autoread
set inccommand=split
set wildignore+=*/target/*
set termguicolors
set fillchars=vert:│

autocmd BufWritePre * %s/\s\+$//e

set completeopt=menu,menuone,preview,noselect,noinsert

"if exists('g:gui_oni')
"  set smartcase
"
"  " Turn off statusbar, because it is externalized
"  set noruler
"  set laststatus=0
"  set noshowcmd
"
"  unmap ,f
"  unmap ,t
"  unmap ,n
"endif

" easymotion
let g:EasyMotion_keys = 'bpovdljzwxyqghfknarusite'

" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_hls_cursor = 'purple'

" one
let g:one_allow_italics = 1

colorscheme one
set background=dark

source ~/.config/nvim/lightline.vim

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
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'

" FZF
set rtp+=/usr/local/opt/fzf
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

autocmd CompleteDone * silent! pclose!

" ALE
let g:ale_set_baloons = 1
let g:ale_virtualtext_cursor = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
  \ 'cpp': ['cquery'],
  \ 'rust': ['rls'],
  \ 'vue': ['eslint', 'vls']
  \ }
let g:ale_rust_rls_toolchain = 'stable'

highlight link ALEError Error
highlight link ALEWarning Warning

" nvim-gdb
let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ }

" indentLine
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['markdown', 'startify']

" Tagbar
let g:tagbar_map_zoomwin = 'a'
let g:tagbar_map_togglesort = 'u'

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" LSP
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'cpp': ['cquery', '--init={"cacheDirectory":"/tmp/cquery/"}']
    \ }

" orgguide-agenda
let g:org_agenda_files=['~/org/*.org']
