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

" transparent text and line numbers
"highlight Normal  guibg=none
"highlight NonText guibg=none
"highlight LineNr  guibg=none

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
let g:rustfmt_autosave = 1

" NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
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

" nvim-blame-line
let g:blameLineGitFormat = '   %an | %ar | %s'

" startify
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_bookmarks = [
  \ '~/.config/nvim/init.vim',
  \ '~/.config/nvim/plug.vim',
  \ '~/.config/nvim/key_bindings.vim',
  \ '~/.zshrc',
  \ ]
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
