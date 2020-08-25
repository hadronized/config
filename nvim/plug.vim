call plug#begin('~/.config/nvim/plugged')

" Better C++ support
Plug 'octol/vim-cpp-enhanced-highlight'

" snippets
Plug 'honza/vim-snippets'

" Haskell
Plug 'neovimhaskell/haskell-vim'
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
Plug 'rust-lang/rust.vim'
let g:rust_recommended_style = 0 " disable Rust recommended style (it forces 4 spaces indent and shit)
let g:rustfmt_autosave = 1

Plug 'tikhomirov/vim-glsl'
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

Plug 'norcalli/nvim-colorizer.lua'

" easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'bpovdljzwxyqghfknarusite'

" edge
Plug 'sainnhe/edge'
let g:edge_style = 'neon'
let g:edge_enable_italic = 1

Plug 'ryanoasis/vim-devicons'

" vim-one
Plug 'rakr/vim-one'
let g:one_allow_italics = 1

" palenight
Plug 'drewtempelmeyer/palenight.vim'

" ayu-theme
Plug 'ayu-theme/ayu-vim'

" shades-of-purple
Plug 'Rigellute/shades-of-purple.vim'
let g:shades_of_purple_italic = 1
let g:shades_of_purple_bold = 1

" gitgutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 10000
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'
let g:gitgutter_highlight_linenrs = 0
let g:gitgutter_override_sign_column_highlight = 0

" fugitive
Plug 'tpope/vim-fugitive'

" git-messenger
Plug 'rhysd/git-messenger.vim'
let g:git_messenger_no_default_mappings = v:true

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

let g:fzf_preview_window = ''
let g:fzf_layout = {
  \'window': {
  \  'width': 1.0,
  \  'height': 0.3,
  \  'yoffset': 0,
  \  'border': 'bottom'
  \}
\}
" let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }

" Markdown.
Plug 'mzlogin/vim-markdown-toc'

" Highlighted Yank
Plug 'machakann/vim-highlightedyank'

" nvim-blame-line
Plug 'tveskag/nvim-blame-line'
let g:blameLineGitFormat = '   %an | %ar | %s'

" startify
Plug 'mhinz/vim-startify'
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ { 'type': 'sessions',  'header': ['   Sessions'] },
  \ { 'type': 'files',     'header': ['   Recent files'] },
  \ { 'type': 'commands',  'header': ['   Commands'] },
  \ ]
let g:startify_bookmarks = [
  \ '~/.config/nvim/init.vim',
  \ '~/.config/nvim/key_bindings.vim',
  \ '~/.config/nvim/plug.vim',
  \ '~/.zshrc',
  \ '~/.config/starship.toml',
  \ '~/.config/termite/config',
  \ '~/.config/i3/config',
  \ ]
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_relative_path = 1
let g:startify_custom_footer=['   We don’t deserve dogs!']
let g:startify_custom_indices = ['a', 'b', 'é', 'p', 'o', 'v', 'd', 'l', 'j', 'g', 'h', 'f', 'y', 'x']

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" vista
Plug 'liuchengxu/vista.vim'

" coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd CursorHold * silent call CocActionAsync('highlight')

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" commentary
Plug 'tpope/vim-commentary'

" which-key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
let g:which_key_use_floating_win = 1
let g:which_key_disable_default_offset = 1

function! RegisterWhichKey()
  call which_key#register('<Space>', 'g:which_key_map')
  call which_key#register('è', 'g:which_key_local_map')
endfunction

autocmd! User vim-which-key call RegisterWhichKey()

" org-mode
Plug 'jceb/vim-orgmode'

" lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'edge',
      \ 'active': {
      \   'left': [ [ 'windownb', 'filename', 'paste', 'modified', 'readonly' ],
      \             [ 'fugitive' ],
      \             [ 'current_function', 'coc_status' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'windownb', 'filename'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"±":&modifiable?"":"-"}',
      \   'fugitive': '%{fugitive#head()}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \ },
      \ 'component_function': {
      \   'windownb': 'WindowNumber',
      \   'filetype': 'MyFiletype',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'current_function': 'CocCurrentFunction',
      \   'coc_status': 'coc#status',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFilename()
  return &filetype ==# 'startify' ? 'Welcome back!' :
       \ expand('%:f') !=# '' ? expand('%:f') :
       \ 'scratch'
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

set statusline+=%#warningmsg#
set statusline+=%*

" ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
