let mapleader=' '
let maplocalleader = 'è'

let g:which_key_map = { 'name': 'top level' }

" disable some keybindings from other packages
"nmap <leader>ww <Nope>

" misc
noremap U :redo<CR>

" tab key bindings
noremap <silent> <C-c> :tabp<CR>
noremap <silent> <C-r> :tabn<CR>
noremap <silent> <C-n> :tabnew<CR>

" commentary
map <silent> <leader>/ :Commentary<CR>
let g:which_key_map['/'] = '(un)comment line'

" file tree
noremap <silent> <leader>n :NERDTreeToggle<CR>
let g:which_key_map.n = 'file browser'

" fuzzy finders
noremap <silent> <leader>b :Buffers<CR>
let g:which_key_map.b = 'find buffer'
noremap <silent> <leader>f :Files<CR>
let g:which_key_map.f = 'find file'

" fuzzy git
let g:which_key_map.g = { 'name': '+git' }
noremap <silent> <leader>gb :Gblame<CR>
let g:which_key_map.g.b = 'blame'
noremap <silent> <leader>gB :GitMessenger<CR>
let g:which_key_map.g.B = 'commit under cursor'
noremap <silent> <leader>gl :ToggleBlameLine<CR>
let g:which_key_map.g.l = 'toggle lens'
noremap <silent> <leader>gc :Commits<CR>
let g:which_key_map.g.c = 'find commit'
noremap <silent> <leader>gf :GFiles<CR>
let g:which_key_map.g.f = 'find file'
noremap <silent> <leader>gs :GFiles?<CR>
let g:which_key_map.g.s = 'status'
noremap <silent> <leader>gp :GitGutterPrevHunk<CR>
let g:which_key_map.g.p = 'previous hunk'
noremap <silent> <leader>gt :GitGutterNextHunk<CR>
let g:which_key_map.g.n = 'next hunk'

nmap <silent> <leader>w <Plug>(easymotion-bd-w)
nmap <silent> <leader>W <Plug>(easymotion-overwin-w)
nmap <silent> <leader>c <Plug>(easymotion-bd-f)
nmap <silent> <leader>C <Plug>(easymotion-overwin-f)
nmap <silent> <leader>l <Plug>(easymotion-bd-jk)
nmap <silent> <leader>L <Plug>(easymotion-overwin-line)

" coc.vim
nmap <silent>       <leader>d   <Plug>(coc-definition)
nmap <silent>       <leader>t   <Plug>(coc-type-definition)
nmap <silent>       <leader>i   <Plug>(coc-implementation)
nmap <silent>       <leader>r   <Plug>(coc-references)
nmap <silent>       <leader>ps  :CocList symbols<CR>
nmap <silent><expr> <leader>pz  coc#refresh()
nmap <silent>       <leader>pd  :call <SID>show_documentation()<CR>
nmap <silent>       <leader>pl  <Plug>(coc-codelens-action)
nmap <silent>       <leader>pr  <Plug>(coc-rename)
nmap <silent>       <leader>pe  :CocList diagnostics<CR>
nmap <silent>       <leader>xp  <Plug>(coc-diagnostic-prev)
nmap <silent>       <leader>xn  <Plug>(coc-diagnostic-next)
nmap <silent>       <leader>pva <Plug>(coc-codeaction-selected>
xmap <silent>       <leader>pva <Plug>(coc-codeaction-selected>
nmap <silent>       <leader>pa  <Plug>(coc-codeaction>
nmap <silent>       <leader>pf  <Plug>(coc-fix-current>

noremap <silent> <leader>qe :cc!<CR>
noremap <silent> <leader>qn :cn!<CR>
noremap <silent> <leader>qp :cp!<CR>
noremap <silent> <leader>qo :cope<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" WhichKey
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey 'è'<CR>
