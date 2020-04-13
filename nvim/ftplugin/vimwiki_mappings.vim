nnoremap <silent> <Return> :VimwikiFollowLink<Return>
nnoremap <silent> <S-Return> :VimwikiSplitLink<Return>
nnoremap <silent> <C-Return> :VimwikiVSplitLink<Return>
nnoremap <silent> <C-S-Return> :VimwikiTabnewLink<Return>
nnoremap <silent> <Backspace> :VimwikiGoBackLink<Return>
nnoremap <silent> <Tab> :VimwikiNextLink<Return>
nnoremap <silent> <S-Tab> :VimwikiPrevLink<Return>
nnoremap <silent> <C-Space> :VimToggleListItem<Return>

let g:which_key_local_map.p = { 'name': 'page' }

nnoremap <silent> <localleader>pg :VimwikiGoto<CR>
let g:which_key_local_map.p.g = 'go to'

nnoremap <silent> <localleader>pd :VimwikiDeleteLink<CR>
let g:which_key_local_map.p.d = 'delete link'

nnoremap <silent> <localleader>pr :VimwikiRenameLink<CR>
let g:which_key_local_map.p.r = 'rename page'

nnoremap <silent> <localleader>pg :VimwikiDiaryGenerateLinks<CR>
let g:which_key_local_map.p.g = 'refresh'

let g:which_key_local_map.t = { 'name': 'tasks' }

nnoremap <silent> <localleader>tn :VimwikiNextTask<CR>
let g:which_key_local_map.t.n = 'next task'

nnoremap <silent> <localleader>td :VimwikiIncrease<CR>
let g:which_key_local_map.t.n = 'next task'

let g:which_key_local_map.c =  { 'name': 'checkbox' }

nnoremap <silent> <localleader>ct :VimwikiToggleListItem<CR>
let g:which_key_local_map.c.t = 'toggle'

nnoremap <silent> <localleader>cd :VimwikiRemoveSingleCB<CR>
let g:which_key_local_map.c.d = 'remove'

nnoremap <silent> <localleader>cD :VimwikiRemoveCBInList<CR>
let g:which_key_local_map.c.D = 'remove all'

