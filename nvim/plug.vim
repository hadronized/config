call plug#begin('~/.config/nvim/plugged')

" -- THEMES ----------------------------------------------------------------------------------------
" edge
Plug 'sainnhe/edge'
let g:edge_style = 'neon'
let g:edge_enable_italic = 1

" All the nice icons!
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

" candid
Plug 'flrnd/candid.vim'

" sonokai
Plug 'phaazon/sonokai'
let g:sonokai_enable_italic = 1
let g:sonokai_better_performance = 1
let g:sonokai_style = 'andromeda'
let g:sonokai_sign_column_background = 'none'
let g:sonokai_diagnostic_line_hilight = 1

" -- LANGUAGES -------------------------------------------------------------------------------------
" treesitter
" Plug 'nvim-treesitter/nvim-treesitter'

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

" " Rust
" Plug 'rust-lang/rust.vim'
" let g:rust_recommended_style = 0 " disable Rust recommended style (it forces 4 spaces indent and shit)
" let g:rustfmt_autosave = 1

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" GLSL
Plug 'tikhomirov/vim-glsl'

" TOML
Plug 'cespare/vim-toml'

" Elm
Plug 'ElmCast/elm-vim'

" Idris
Plug 'idris-hackers/idris-vim'

" Vue
Plug 'posva/vim-vue'

" sxhkdrc
Plug 'baskerville/vim-sxhkdrc'

" -- PRODUCTIVITY ----------------------------------------------------------------------------------
" Superbe colorizer.
Plug 'norcalli/nvim-colorizer.lua'

" gitgutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 10000
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▎'
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
let g:fzf_preview_window = ''
let $FZF_DEFAULT_OPTS = '--reverse'

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

autocmd CompleteDone * silent! pclose!

" nvim-blame-line
Plug 'tveskag/nvim-blame-line'
let g:blameLineGitFormat = '   %an | %ar | %s'

" vista
Plug 'liuchengxu/vista.vim'

" coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call
      \ CocActionAsync('showSignatureHelp')

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" better color for coc hints
au Colorscheme * call OverrideCocHighlights()

function OverrideCocHighlights()
  hi! CocRustChainingHint NONE
  hi! link CocRustChainingHint Comment
endfunction

" LSP
Plug 'neovim/nvim-lspconfig'

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
let g:org_agenda_files = ['~/org/index.org']
let g:org_aggressive_conceal = 1
let g:org_heading_shade_leading_stars = 1
let g:org_todo_keywords = ['TODO', 'WIP', 'REVIEW', '|', 'DONE', 'CANCELLED']
let g:org_indent = 1

" lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'windownb', 'filename', 'paste', 'modified', 'readonly' ],
      \             [ 'fugitive' ],
      \             [ 'coc_status' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'windownb', 'filename'] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ],
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
       \ expand('%:t') !=# '' ? expand('%:t') :
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

" easy-align
Plug 'junegunn/vim-easy-align'

" clap
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" let g:clap_insert_mode_only = v:true
" let g:clap_current_selection_sign = { 'text': '->', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
" let g:clap_selected_sign = { 'text': ' ·', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
" let g:clap_fuzzy_match_hl_groups = [
"       \ [118 , '#9922ff'] ,
"       \ [82  , '#a236ff'] ,
"       \ [46  , '#ab49ff'] ,
"       \ [47  , '#b45dff'] ,
"       \ [48  , '#bd70ff'] ,
"       \ [49  , '#c684ff'] ,
"       \ [50  , '#f287ca'] ,
"       \ [51  , '#f075c3'] ,
"       \ [87  , '#ef63bb'] ,
"       \ [123 , '#ed51b3'] ,
"       \ [159 , '#eb40ab'] ,
"       \ [195 , '#e92ea4'] ,
"       \ ]

" dashboard
"Plug 'hardcoreplayers/dashboard-nvim'
"let g:dashboard_session_directory = '~/.local/share/nvim/session'
"let g:dashboard_custom_shortcut = {
"      \ 'last_session'       : 'SPC s l',
"      \ 'find_history'       : 'SPC f h',
"      \ 'find_file'          : 'SPC f f',
"      \ 'new_file'           : 'SPC b v',
"      \ 'change_colorscheme' : 'SPC t c',
"      \ 'find_word'          : 'SPC r r',
"      \ 'book_marks'         : 'SPC f m',
"      \ }

" Narrow region
Plug 'chrisbra/NrrwRgn'

" Syntax range
Plug 'inkarkat/vim-SyntaxRange'

" File explorer.
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" marksman
Plug 'svermeulen/nvim-marksman', { 'do': ':UpdateRemotePlugins' }

" -- MOTIONS ---------------------------------------------------------------------------------------
" easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'bpovdljzwxyqghfknarusite'
let g:EasyMotion_do_mapping = 0


" any-jump
Plug 'pechorin/any-jump.vim'
let g:any_jump_disable_default_keybindings = 1

" aerojump
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
let g:aerojump_keymaps = {
  \ "<C-t>": "AerojumpDown",
  \ "<C-s>": "AerojumpUp",
  \ "<Esc>": "AerojumpExit",
  \ "<CR>": "AerojumpSelect",
  \ }

call plug#end()
