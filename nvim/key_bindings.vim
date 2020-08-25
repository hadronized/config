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
noremap <silent> <leader>f :GFiles<CR>
noremap <silent> <leader>F :Files<CR>
noremap <silent> <leader>zc :Commands<CR>
noremap <silent> <leader>zf :Filetypes<CR>
noremap <silent> <leader>zl :BLines<CR>
noremap <silent> <leader>zr :Rg<CR>
noremap <silent> <leader>zs :Snippets<CR>
let g:which_key_map.b = 'find buffer'
let g:which_key_map.f = 'find git file'
let g:which_key_map.F = 'find file'
let g:which_key_map.z = { 'name': '+fuzzy' }
let g:which_key_map.z.c = 'commands'
let g:which_key_map.z.f = 'file types'
let g:which_key_map.z.l = 'buffer lines'
let g:which_key_map.z.r = 'everywhere'
let g:which_key_map.z.s = 'snippets'

" fuzzy git

noremap <silent> <leader>gb :Gblame<CR>
noremap <silent> <leader>gB :GitMessenger<CR>
noremap <silent> <leader>gl :ToggleBlameLine<CR>
noremap <silent> <leader>gL :GitGutterLineHighlightsToggle<CR>
noremap <silent> <leader>gc :BCommits<CR>
noremap <silent> <leader>gC :Commits<CR>
noremap <silent> <leader>gf :Git fetch --prune --all<CR>
noremap <silent> <leader>gP :Git push<Space>
noremap <silent> <leader>gs :GitGutterStageHunk<CR>
noremap <silent> <leader>gu :GitGutterUndoHunk<CR>
noremap <silent> <leader>gh :GitGutterPreviewHunk<CR>
noremap <silent> <leader>gp :GitGutterPrevHunk<CR>
noremap <silent> <leader>gn :GitGutterNextHunk<CR>
noremap <silent> <leader>gg :Git<CR>
noremap <silent> <leader>gz :GitGutterFold<CR>
noremap <silent> <leader>gx :GitGutterLineNrHighlightsToggle<CR>
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_map.g.b = 'blame'
let g:which_key_map.g.B = 'commit under cursor'
let g:which_key_map.g.l = 'toggle lens'
let g:which_key_map.g.L = 'toggle line highlighting'
let g:which_key_map.g.c = 'buffer commits'
let g:which_key_map.g.C = 'commits'
let g:which_key_map.g.f = 'fetch'
let g:which_key_map.g.P = 'push'
let g:which_key_map.g.s = 'stage hunk'
let g:which_key_map.g.u = 'unstage hunk'
let g:which_key_map.g.h = 'preview hunk'
let g:which_key_map.g.p = 'previous hunk'
let g:which_key_map.g.n = 'next hunk'
let g:which_key_map.g.g = 'status'
let g:which_key_map.g.z = 'fold'
let g:which_key_map.g.x = 'toggle line number highlighting'

" Convenient text objects
omap ic <Plug>(GitGutterTextObjectInnerPending)
omap ac <Plug>(GitGutterTextObjectOuterPending)
xmap ic <Plug>(GitGutterTextObjectInnerVisual)
xmap ac <Plug>(GitGutterTextObjectOuterVisual)

nmap <silent> <leader>w <Plug>(easymotion-bd-w)
nmap <silent> <leader>W <Plug>(easymotion-overwin-w)
nmap <silent> <leader>c <Plug>(easymotion-bd-f)
nmap <silent> <leader>C <Plug>(easymotion-overwin-f)
nmap <silent> <leader>l <Plug>(easymotion-bd-jk)
nmap <silent> <leader>L <Plug>(easymotion-overwin-line)
let g:which_key_map.w = 'go to word'
let g:which_key_map.W = 'go to word everywhere'
let g:which_key_map.c = 'go to char'
let g:which_key_map.C = 'go to char everywhere'
let g:which_key_map.l = 'go to line'
let g:which_key_map.L = 'go to line everywhere'

" coc.vim
nmap <silent>       <leader>d   <Plug>(coc-definition)
nmap <silent>       <leader>t   <Plug>(coc-type-definition)
nmap <silent>       <leader>i   <Plug>(coc-implementation)
nmap <silent>       <leader>r   <Plug>(coc-references)
let g:which_key_map.d = 'go to definition'
let g:which_key_map.t = 'go to type definition'
let g:which_key_map.i = 'go to implementation'
let g:which_key_map.r = 'show references'

nmap <silent> <leader>ps :CocList symbols<CR>
nmap <silent> <leader>po :CocList outline<CR>
nmap <silent> <leader>pt :Vista coc<CR>
nmap <silent> <leader>pd :call <SID>show_documentation()<CR>
nmap <silent> <leader>pl <Plug>(coc-codelens-action)
nmap <silent> <leader>pr <Plug>(coc-rename)
nmap <silent> <leader>pps :SSave<CR>
nmap <silent> <leader>ppl :SLoad<CR>
nmap <silent> <leader>ppd :SDelete<CR>
nmap <silent> <leader>ppm :Startify<CR>
nmap <silent> <leader>ppc :SClose<CR>
let g:which_key_map.p = { 'name': '+project' }
let g:which_key_map.p.s = 'show symbols'
let g:which_key_map.p.o = 'outline'
let g:which_key_map.p.t = 'outline tree'
let g:which_key_map.p.d = 'show documentation'
let g:which_key_map.p.l = 'lens action'
let g:which_key_map.p.r = 'rename'
let g:which_key_map.p.p = { 'name': '+session' }
let g:which_key_map.p.p.s = 'save'
let g:which_key_map.p.p.l = 'load'
let g:which_key_map.p.p.d = 'delete'
let g:which_key_map.p.p.m = 'startify'
let g:which_key_map.p.p.c = 'close'

nmap <silent> <leader>pxl :CocList diagnostics<CR>
nmap <silent> <leader>pxp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>pxn <Plug>(coc-diagnostic-next-error)
let g:which_key_map.p.x = { 'name': '+diagnostics' }
let g:which_key_map.p.x.l = 'show all'
let g:which_key_map.p.x.p = 'previous error'
let g:which_key_map.p.x.n = 'next error'

nmap <silent>       <leader>pa  :CocCommand actions.open<CR>
vnoremap <silent>   <leader>a   :CocCommand actions.open<CR>
let g:which_key_map.p.a = 'code action'

nmap <silent> <leader>pf  <Plug>(coc-fix-current)
nmap <silent> <leader>.l  :CocList bookmark<CR>
nmap <silent> <leader>.t  :CocCommand bookmark.toggle<CR>
nmap <silent> <leader>.a  :CocCommand bookmark.annotate<CR>
nmap <silent> <leader>.n  :CocCommand bookmark.next<CR>
nmap <silent> <leader>.p  :CocCommand bookmark.prev<CR>
nmap <silent> <leader>.c  :CocCommand bookmark.clearForCurrentFile<CR>
nmap <silent> <leader>.C  :CocCommand bookmark.clearForAllFiles<CR>
let g:which_key_map.p.f = 'fix'
let g:which_key_map['.'] = { 'name': '+bookmarks' }
let g:which_key_map['.'].l = 'list bookmarks'
let g:which_key_map['.'].t = 'toggle bookmark'
let g:which_key_map['.'].a = 'annotate bookmark'
let g:which_key_map['.'].n = 'next bookmark'
let g:which_key_map['.'].p = 'previous bookmark'
let g:which_key_map['.'].c = 'clear (current file)'
let g:which_key_map['.'].C = 'clear (all files)'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" WhichKey
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey 'è'<CR>

nnoremap <silent> <leader>h :ColorizerToggle<CR>
let g:which_key_map.h = 'highlight colors'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
