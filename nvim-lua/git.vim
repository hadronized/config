" Fugitive, the “git status” for neovim.
Plug 'tpope/vim-fugitive'

" Git signs in the gutter column and inline hunk preview / staging.
Plug 'airblade/vim-gitgutter'

let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 10000
let g:gitgutter_sign_added = "▎"
let g:gitgutter_sign_modified = "▎"
let g:gitgutter_sign_removed = "▁"
let g:gitgutter_sign_removed_first_line = "▔"
let g:gitgutter_sign_modified_removed = "▎"
let g:gitgutter_highlight_linenrs = 0
let g:gitgutter_override_sign_column_highlight = 0

"autocmd User GitGutter call _
"autocmd User GitGutterStage call _

" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction
" set statusline+=%{GitStatus()}

" Blame at the end of the line.
Plug 'tveskag/nvim-blame-line'
let g:blameLineGitFormat = '   %an | %ar | %s'

" The new shiny toy.
" Plug 'TimUntersberger/neogit'
