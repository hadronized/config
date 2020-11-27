" Fugitive, the “git status” for neovim.
Plug 'tpope/vim-fugitive'
noremap <silent> <leader>gg <cmd>Git<cr>
noremap <silent> <leader>gw <cmd>Gwrite<cr>

" Git signs in the gutter column and inline hunk preview / staging.
Plug 'airblade/vim-gitgutter'

let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 10000
let g:gitgutter_sign_added = "\u00a0│"
let g:gitgutter_sign_modified = "\u00a0│"
let g:gitgutter_sign_removed = "\u00a0_"
let g:gitgutter_sign_removed_first_line = "\u00a0▔"
let g:gitgutter_sign_modified_removed = "\u00a0│"
let g:gitgutter_highlight_linenrs = 0
let g:gitgutter_override_sign_column_highlight = 0

noremap <silent> <leader>gf  <cmd>GitGutterQuickFix<cr>
noremap <silent> <leader>gh  <cmd>GitGutterPreviewHunk<cr>
noremap <silent> <leader>gn  <cmd>GitGutterNextHunk<cr>
noremap <silent> <leader>gp  <cmd>GitGutterPrevHunk<cr>
noremap <silent> <leader>gf  <cmd>GitGutterPrevHunk<cr>
noremap <silent> <leader>gs  <cmd>GitGutterStageHunk<cr>
noremap <silent> <leader>gx  <cmd>GitGutterUndoHunk<cr>
noremap <silent> <leader>gz  <cmd>GitGutterFold<cr>

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
