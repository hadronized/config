Plug 'kyazdani42/nvim-tree.lua'

let g:lua_tree_side = 'left' " or right
let g:lua_tree_width = 40 " 30 by default
let g:lua_tree_ignore = [] " empty by default
let g:lua_tree_auto_open = 0 " 0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 1 " 0 by default, closes the tree when it's the last window
let g:lua_tree_quit_on_open = 0 " 0 by default, closes the tree when you open a file
let g:lua_tree_follow = 1 " 0 by default, this option allows the cursor to be updated when entering a buffer
let g:lua_tree_indent_markers = 1 " 0 by default, this option shows indent markers when folders are open
let g:lua_tree_hide_dotfiles = 1 " 0 by default, this option hides files and folders starting with a dot `.`
let g:lua_tree_git_hl = 1 " 0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:lua_tree_root_folder_modifier = ':.' "This is the default. See :help filename-modifiers for more options
let g:lua_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:lua_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

let g:lua_tree_bindings = {
    \ 'edit':            '<cr>',
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-o>',
    \ 'edit_tab':        '<C-t>',
    \ 'toggle_ignored':  'i',
    \ 'toggle_dotfiles': '.',
    \ 'refresh':         'R',
    \ 'preview':         '<TAB>',
    \ 'cd':              'o',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'y',
    \ 'paste':           'p',
    \ }

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:lua_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': ""
    \   }
    \ }
