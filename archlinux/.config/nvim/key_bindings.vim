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
let g:which_key_map.w = 'go to word'
nmap <silent> <leader>W <Plug>(easymotion-overwin-w)
let g:which_key_map.W = 'go to word everywhere'
nmap <silent> <leader>c <Plug>(easymotion-bd-f)
let g:which_key_map.c = 'go to char'
nmap <silent> <leader>C <Plug>(easymotion-overwin-f)
let g:which_key_map.C = 'go to char everywhere'
nmap <silent> <leader>l <Plug>(easymotion-bd-jk)
let g:which_key_map.l = 'go to line'
nmap <silent> <leader>L <Plug>(easymotion-overwin-line)
let g:which_key_map.l = 'go to line everywhere'

" coc.vim
nmap <silent>       <leader>d   <Plug>(coc-definition)
let g:which_key_map.d = 'go to definition'
nmap <silent>       <leader>t   <Plug>(coc-type-definition)
let g:which_key_map.t = 'go to type definition'
nmap <silent>       <leader>i   <Plug>(coc-implementation)
let g:which_key_map.i = 'go to implementation'
nmap <silent>       <leader>r   <Plug>(coc-references)
let g:which_key_map.r = 'show references'

let g:which_key_map.p = { 'name': 'project' }
nmap <silent>       <leader>ps  :CocList symbols<CR>
let g:which_key_map.p.s = 'show symbols'
nmap <silent><expr> <leader>pz  coc#refresh()
let g:which_key_map.p.z = 'refresh'
nmap <silent>       <leader>pd  :call <SID>show_documentation()<CR>
let g:which_key_map.p.d = 'show documentation'
nmap <silent>       <leader>pl  <Plug>(coc-codelens-action)
let g:which_key_map.p.l = 'lens action'
nmap <silent>       <leader>pr  <Plug>(coc-rename)
let g:which_key_map.p.r = 'lens action'
nmap <silent>       <leader>pe  :CocList diagnostics<CR>
let g:which_key_map.p.e = 'show diagnostics'
nmap <silent>       <leader>xp  <Plug>(coc-diagnostic-prev)
nmap <silent>       <leader>xn  <Plug>(coc-diagnostic-next)
nmap <silent>       <leader>pa  <Plug>(coc-codeaction>
let g:which_key_map.p.a = 'code action'
nmap <silent>       <leader>pva <Plug>(coc-codeaction-selected>
nmap <silent>       <leader>pf  <Plug>(coc-fix-current>
let g:which_key_map.p.f = 'fix'

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
