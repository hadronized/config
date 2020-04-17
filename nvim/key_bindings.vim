let mapleader=' '
let maplocalleader = 'è'

let g:which_key_map = { 'name': 'top level' }
let g:which_key_local_map = { 'name': 'local' }

" misc
noremap U :redo<CR>

" tab key bindings
noremap <silent> <C-c> :tabp<CR>
noremap <silent> <C-r> :tabn<CR>
noremap <silent> <C-n> :tabnew<CR>
noremap <silent> <C-q> :tabclose<CR>

" commentary
map <silent> <leader>/ :Commentary<CR>
let g:which_key_map['/'] = '(un)comment line'

" file tree
noremap <silent> <leader>n :NERDTreeToggle<CR>
let g:which_key_map.n = 'file browser'

" fuzzy finders
noremap <silent> <leader>b :Buffers<CR>
let g:which_key_map.b = 'find buffer'

noremap <silent> <leader>f :GFiles<CR>
let g:which_key_map.f = 'find git file'

noremap <silent> <leader>F :Files<CR>
let g:which_key_map.F = 'find file'

noremap <silent> <leader>z :Rg<CR>
let g:which_key_map.z = 'ripgrep'

" fuzzy git
let g:which_key_map.g = { 'name': '+git' }

noremap <silent> <leader>gb :Gblame<CR>
let g:which_key_map.g.b = 'blame'

noremap <silent> <leader>gB :GitMessenger<CR>
let g:which_key_map.g.B = 'commit under cursor'

noremap <silent> <leader>gl :ToggleBlameLine<CR>
let g:which_key_map.g.l = 'toggle lens'

noremap <silent> <leader>gL :GitGutterLineHighlightsToggle<CR>
let g:which_key_map.g.L = 'toggle line highlighting'

noremap <silent> <leader>gc :Commits<CR>
let g:which_key_map.g.c = 'find commit'

noremap <silent> <leader>gf :Git fetch --prune --all<CR>
let g:which_key_map.g.f = 'fetch'

noremap <leader>gP :Git push<Space>
let g:which_key_map.g.P = 'push'

noremap <silent> <leader>gs :GitGutterStageHunk<CR>
let g:which_key_map.g.s = 'stage hunk'

noremap <silent> <leader>gu :GitGutterUndoHunk<CR>
let g:which_key_map.g.u = 'unstage hunk'

noremap <silent> <leader>gh :GitGutterPreviewHunk<CR>
let g:which_key_map.g.h = 'preview hunk'

noremap <silent> <leader>gp :GitGutterPrevHunk<CR>
let g:which_key_map.g.p = 'previous hunk'

noremap <silent> <leader>gn :GitGutterNextHunk<CR>
let g:which_key_map.g.n = 'next hunk'

noremap <silent> <leader>gg :Git<CR>
let g:which_key_map.g.g = 'git status'

noremap <silent> <leader>gx :GitGutterLineNrHighlightsToggle<CR>
let g:which_key_map.g.x = 'toggle line number highlighting'

" Convenient text objects
omap ic <Plug>(GitGutterTextObjectInnerPending)
omap ac <Plug>(GitGutterTextObjectOuterPending)
xmap ic <Plug>(GitGutterTextObjectInnerVisual)
xmap ac <Plug>(GitGutterTextObjectOuterVisual)

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
let g:which_key_map.p.r = 'rename'
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

" startify
let g:which_key_map.s = { 'name': 'session' }

nnoremap <silent> <leader>ss :SSave<CR>
let g:which_key_map.s.s = 'save'

nnoremap <silent> <leader>sl :SLoad<CR>
let g:which_key_map.s.l = 'load'

nnoremap <silent> <leader>sd :SDelete<CR>
let g:which_key_map.s.d = 'delete'

nnoremap <silent> <leader>sm :Startify<CR>
let g:which_key_map.s.m = 'startify'

nnoremap <silent> <leader>sc :SClose<CR>
let g:which_key_map.s.c = 'close'

" vimwiki
let g:which_key_map.o = { 'name': 'organize' }

nnoremap <silent> <leader>oi :VimwikiIndex<CR>
let g:which_key_map.o.i = 'index'

nnoremap <silent> <leader>oI :VimwikiTabIndex<CR>
let g:which_key_map.o.I = 'index (tab)'

nnoremap <silent> <leader>od :VimwikiDiaryIndex<CR>
let g:which_key_map.o.d = 'diary'

nnoremap <silent> <leader>ot :VimwikiMakeDiaryNote<CR>
let g:which_key_map.o.t = 'today diary'

nnoremap <silent> <leader>oT :VimwikiMakeTabDiaryNote<CR>
let g:which_key_map.o.T = 'today diary (tab)'

nnoremap <silent> <leader>oy :VimwikiMakeYesterdayDiaryNote<CR>
let g:which_key_map.o.y = 'yesterday diary'

nnoremap <silent> <leader>ow :VimwikiMakeTomorrowDiaryNote<CR>
let g:which_key_map.o.w = 'torrow diary'

let g:which_key_map.o.g = { 'name': 'generate' }

nnoremap <silent> <leader>ogd :VimwikiDiaryGenerateLinks<CR>
let g:which_key_map.o.g.d = 'diary'

nnoremap <silent> <leader>ogi :VimwikiGenerateLinks<CR>
let g:which_key_map.o.g.i = 'index'

nnoremap <silent> <leader>$ :call SwitchDarkLightColorscheme()<CR>
let g:which_key_map['$'] = 'switch dark/light theme'
