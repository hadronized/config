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
set fillchars=vert:│

autocmd BufWritePre * %s/\s\+$//e

set completeopt=menu,menuone,preview,noselect,noinsert

" easymotion
let g:EasyMotion_keys = 'bpovdljzwxyqghfknarusite'

" one
let g:one_allow_italics = 1

" material
let g:material_terminal_italics = 1

" ayu
let ayucolor="mirage"

" shades-of-purple
let g:shades_of_purple_italic = 1
let g:shades_of_purple_bold = 1

set background=dark
colorscheme shades_of_purple

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
"let g:rustfmt_autosave = 1

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
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

autocmd CompleteDone * silent! pclose!

" Tagbar
let g:tagbar_map_zoomwin = 'a'
let g:tagbar_map_togglesort = 'u'

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" orgguide-agenda
let g:org_agenda_files = ['~/org/*.org']
let g:org_aggressive_conceal = 1
let g:org_todo_keywords = ['TODO', 'WIP', 'DONE']
let g:org_heading_highlight_colors = ['Title', 'Special', 'Statement', 'Identifier', 'PreProc', 'Type']
let g:org_todo_keyword_faces = [
  \ ['TODO', [':foreground #f07178', ':weight bold']],
  \ ['WIP', [':foreground #c792ea', ':weight bold']],
  \ ['DONE', [':foreground #c3e88d']]
  \ ]

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1

" nvim-blame-line
let g:blameLineGitFormat = '   %an | %ar | %s'
