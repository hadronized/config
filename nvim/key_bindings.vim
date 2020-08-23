let mapleader=' '
let maplocalleader = 'è'

let g:which_key_map = { 'name': 'top level' }
let g:which_key_local_map = { 'name': 'local' }

" misc
noremap U :redo<CR>

" Window numbering
let i = 1
while i <= 9
    execute 'nnoremap <silent> <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" tab key bindings
noremap <silent> <C-c> :tabp<CR>
noremap <silent> <C-r> :tabn<CR>
noremap <silent> <C-n> :tabnew<CR>
noremap <silent> <C-q> :tabclose<CR>

" next / prev vim like
inoremap <silent> <C-s> <C-p>
inoremap <silent> <C-t> <C-n>

" extensions
map <silent> <leader>em :CocList marketplace<CR>
let g:which_key_map.e = { 'name': '+extension' }
let g:which_key_map.e.m = 'marketplace'

" commentary
map <silent> <leader>/ :Commentary<CR>
let g:which_key_map['/'] = '(un)comment line'

" file tree
noremap <silent> <leader>n :CocCommand explorer<CR>
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
let g:which_key_map.g.g = 'status'

noremap <silent> <leader>gz :GitGutterFold<CR>
let g:which_key_map.g.z = 'fold'

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

let g:which_key_map.p = { 'name': '+project' }
nmap <silent>       <leader>ps  :CocList symbols<CR>
let g:which_key_map.p.s = 'show symbols'
nmap <silent>       <leader>po  :CocList outline<CR>
let g:which_key_map.p.o = 'outline'
nmap <silent>       <leader>pt  :Vista coc<CR>
let g:which_key_map.p.t = 'outline tree'
nmap <silent><expr> <leader>pz  coc#refresh()
let g:which_key_map.p.z = 'refresh'
nmap <silent>       <leader>pd  :call <SID>show_documentation()<CR>
let g:which_key_map.p.d = 'show documentation'
nmap <silent>       <leader>pl  <Plug>(coc-codelens-action)
let g:which_key_map.p.l = 'lens action'
nmap <silent>       <leader>pr  <Plug>(coc-rename)
let g:which_key_map.p.r = 'rename'

let g:which_key_map.p.x = { 'name': '+diagnostics' }
let g:which_key_map.p.x.l = 'show all'
let g:which_key_map.p.x.p = 'previous error'
let g:which_key_map.p.x.n = 'next error'
nmap <silent> <leader>pxl :CocList diagnostics<CR>
nmap <silent> <leader>pxp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>pxn <Plug>(coc-diagnostic-next-error)

nmap <silent>       <leader>pa  :CocCommand actions.open<CR>
vnoremap <silent>   <leader>a   :CocCommand actions.open<CR>
let g:which_key_map.p.a = 'code action'

nmap <silent>       <leader>pf  <Plug>(coc-fix-current)
let g:which_key_map.p.f = 'fix'
let g:which_key_map['.'] = { 'name': '+bookmarks' }
nmap <silent>       <leader>.l  :CocList bookmark<CR>
let g:which_key_map['.'].l = 'list bookmarks'
nmap <silent>       <leader>.t  :CocCommand bookmark.toggle<CR>
let g:which_key_map['.'].t = 'toggle bookmark'
nmap <silent>       <leader>.a  :CocCommand bookmark.annotate<CR>
let g:which_key_map['.'].a = 'annotate bookmark'
nmap <silent>       <leader>.n  :CocCommand bookmark.next<CR>
let g:which_key_map['.'].n = 'next bookmark'
nmap <silent>       <leader>.p  :CocCommand bookmark.prev<CR>
let g:which_key_map['.'].p = 'previous bookmark'
nmap <silent>       <leader>.c  :CocCommand bookmark.clearForCurrentFile<CR>
let g:which_key_map['.'].c = 'clear (current file)'
nmap <silent>       <leader>.C  :CocCommand bookmark.clearForAllFiles<CR>
let g:which_key_map['.'].C = 'clear (all files)'

noremap <silent> <leader>qe :cc!<CR>
noremap <silent> <leader>qn :cn!<CR>
noremap <silent> <leader>qp :cp!<CR>
noremap <silent> <leader>qo :cope<CR>

let g:coc_snippet_next = '<C-t>'
let g:coc_snippet_prev = '<C-s>'

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

inoremap <silent><expr> <c-space> coc#refresh()

" WhichKey
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey 'è'<CR>

" startify
let g:which_key_map.s = { 'name': '+session' }

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

nnoremap <silent> <leader>h :ColorizerToggle<CR>
let g:which_key_map.h = 'highlight colors'
