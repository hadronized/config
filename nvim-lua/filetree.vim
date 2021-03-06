Plug 'kyazdani42/nvim-tree.lua'

let g:nvim_tree_side = 'left' " or right
let g:nvim_tree_width = 40 " 30 by default
let g:nvim_tree_ignore = [ '.git', '.target' ] " empty by default
let g:nvim_tree_auto_open = 0 " 0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 " 0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 0 " 0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 " 0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 " 0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 " 0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 " 0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':.' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
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
