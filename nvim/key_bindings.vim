" Keybindings.
"
" Hierarchy:
"
" - window
"   - 1..9 for window jump
" - bookmark
"   - list bookmarks
"   - add unannotated bookmark
"   - add annotated bookmarks
"   - delete bookmarks in current file
"   - delete all bookmarks
" - extensions
"   - list them all
" - git
"   - fold / unfold
"   - status
"   - blame under cursor
"   - blame buffer
"   - blame lensline
"   - preview hunk
"   - previous hunk
"   - next hunk
"   - unstage hunk
"   - stage hunk
"   - buffer commits
" - project
"   - diagnostics
"   - code action
"   - code fix
"   - show type definition
"   - show documentation
"   - show references
"   - search for symbol in current buffer
"   - search for symbol in worspace
"   - find file in project
"   - find file in project (versioned)
" - tree
"   - open tree viewer
" - snippets
"   - edit snippets for the current mode
"   - search for a snippet
" - search
"   - search for something in lines of current buffer
"   - search for something in workspace
" - misc

let mapleader=' '
let maplocalleader = 'è'

let g:which_key_map = { 'name': 'top level' }
let g:which_key_local_map = { 'name': 'local' }

" misc
noremap U :redo<CR>

let g:which_key_map['$'] = 'hi group at cursor'
nmap <leader>$ :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Window numbering
let i = 1
while i <= 9
    execute 'nnoremap <silent> <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let g:which_key_map[i] = 'window ' . i
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

" commentary
map <silent> <leader>/ :Commentary<CR>
let g:which_key_map['/'] = '(un)comment line'

" bookmarks.
nmap <silent> <leader>.l :CocList bookmark<CR>
nmap <silent> <leader>.a :CocCommand bookmark.toggle<CR>
nmap <silent> <leader>.A :CocCommand bookmark.annotate<CR>
nmap <silent> <leader>.d :CocCommand bookmark.clearForCurrentFile<CR>
nmap <silent> <leader>.D :CocCommand bookmark.clearForAllFiles<CR>
let g:which_key_map['.']   = { 'name': '+bookmarks' }
let g:which_key_map['.'].l = 'list bookmarks'
let g:which_key_map['.'].a = 'add bookmark'
let g:which_key_map['.'].A = 'annotate bookmark'
let g:which_key_map['.'].d = 'clear (current file)'
let g:which_key_map['.'].D = 'clear (all files)'

" extensions
map <silent> <leader>em :CocList marketplace<CR>
let g:which_key_map.e   = { 'name': '+extension' }
let g:which_key_map.e.m = 'marketplace'

" git
noremap <silent> <leader>gi  :GitGutterFold<CR>
noremap <silent> <leader>gg  :Git<CR>
noremap <silent> <leader>gbc :GitMessenger<CR>
noremap <silent> <leader>gbb :Gblame<CR>
noremap <silent> <leader>gbl :ToggleBlameLine<CR>
noremap <silent> <leader>ghh :GitGutterPreviewHunk<CR>
noremap <silent> <leader>ghp :GitGutterPrevHunk<CR>
noremap <silent> <leader>ghn :GitGutterNextHunk<CR>
noremap <silent> <leader>ghx :GitGutterUndoHunk<CR>
noremap <silent> <leader>ghs :GitGutterStageHunk<CR>
noremap <silent> <leader>gc  :BCommits<CR>
let g:which_key_map.g     = { 'name': '+git' }
let g:which_key_map.g.i   = 'isolate changes'
let g:which_key_map.g.g   = 'status'
let g:which_key_map.g.b   = { 'name': '+blame' }
let g:which_key_map.g.b.c = 'cursor'
let g:which_key_map.g.b.b = 'buffer'
let g:which_key_map.g.b.l = 'lens'
let g:which_key_map.g.h   = { 'name': '+hunk' }
let g:which_key_map.g.h.h = 'preview hunk'
let g:which_key_map.g.h.p = 'previous'
let g:which_key_map.g.h.n = 'previous'
let g:which_key_map.g.h.x = 'discard'
let g:which_key_map.g.h.s = 'stage'
let g:which_key_map.g.c   = 'buffer commits'

" project
nmap    <silent> <leader>pDd      :CocList    diagnostics<CR>
nmap    <silent> <leader>pDp      <Plug>(coc-diagnostic-prev-error)
nmap    <silent> <leader>pDn      <Plug>(coc-diagnostic-next-error)
nmap    <silent> <leader>pa       :CocCommand actions.open<CR>
nmap    <silent> <leader>pf       <Plug>(coc-fix-current)
nmap    <silent> <leader>pd       <Plug>(coc-definition)
nmap    <silent> <leader>pt       <Plug>(coc-type-definition)
nmap    <silent> <leader>pi       <Plug>(coc-implementation)
nmap    <silent> <leader>pr       <Plug>(coc-references)
nmap    <silent> <leader>psp      :CocList    symbols<CR>
nmap    <silent> <leader>psb      :CocList    outline<CR>
nmap    <silent> <leader>pp       :call       <SID>show_documentation()<CR>
nmap    <silent> <leader>pl       <Plug>(coc-codelens-action)
nmap    <silent> <leader>pr       <Plug>(coc-rename)
noremap <silent> <leader><leader> :GFiles<CR>
noremap <silent> <leader>ff       :GFiles<CR>
noremap <silent> <leader>f.       :Files<CR>
noremap <silent> <leader>fca      :e          ~/.config/alacritty/alacritty.yml<CR>
noremap <silent> <leader>fcb      :e          ~/.config/bspwm/bspwmrc<CR>
noremap <silent> <leader>fci      :e          ~/.ssh/config<CR>
noremap <silent> <leader>fci      :e          $MYVIMRC<CR>
noremap <silent> <leader>fck      :e          ~/.config/nvim/key_bindings.vim<CR>
noremap <silent> <leader>fcp      :e          ~/.config/nvim/plug.vim<CR>
noremap <silent> <leader>fcs      :e          ~/.config/starship.toml<CR>
noremap <silent> <leader>fcx      :e          ~/.config/sxhkd/sxhkdrc<CR>
noremap <silent> <leader>fcz      :e          ~/.zshrc<CR>
noremap <silent> <leader>fcZ      :e          ~/.zprofile<CR>
noremap <silent> <leader>fod      :call OpenDailyNote()<CR>
noremap <silent> <leader>fot      :e ~/org/tasks/tasks.md<CR>
noremap <silent> <leader>fow      :e ~/org/wiki/wiki.md<CR>

let g:which_key_map.p      = { 'name': '+project' }
let g:which_key_map.p.D    = { 'name': '+diagnostics' }
let g:which_key_map.p.D.d  = 'diagnostics'
let g:which_key_map.p.D.p  = 'previous error'
let g:which_key_map.p.D.n  = 'next error'
let g:which_key_map.p.a    = 'action menu'
let g:which_key_map.p.f    = 'fix'
let g:which_key_map.p.r    = 'show references'
let g:which_key_map.p.d    = 'go to definition'
let g:which_key_map.p.i    = 'go to implementation'
let g:which_key_map.p.t    = 'go to type definition'
let g:which_key_map.p.s    = { 'name': '+symbols' }
let g:which_key_map.p.s.p  = 'search in project'
let g:which_key_map.p.s.b  = 'search in buffer'
let g:which_key_map.p.p    = 'peek documentation'
let g:which_key_map.p.l    = 'lens action'
let g:which_key_map.p.r    = 'rename'
let g:which_key_map.f      = { 'name': '+file' }
let g:which_key_map.f['.'] = 'find in directory'
let g:which_key_map.f.f    = 'find in project'
let g:which_key_map[' ']   = 'find in project'
let g:which_key_map.f.c    = { 'name': '+config' }
let g:which_key_map.f.c.a  = 'alacritty'
let g:which_key_map.f.c.b  = 'bspwm'
let g:which_key_map.f.c.h  = 'ssh'
let g:which_key_map.f.c.i  = 'init'
let g:which_key_map.f.c.k  = 'keybindings'
let g:which_key_map.f.c.p  = 'plugins'
let g:which_key_map.f.c.s  = 'starship'
let g:which_key_map.f.c.x  = 'sxhkd'
let g:which_key_map.f.c.z  = 'zsh'
let g:which_key_map.f.c.Z  = 'zprofile'
let g:which_key_map.f.o    = { 'name': '+org' }
let g:which_key_map.f.o.d  = 'daily notes'
let g:which_key_map.f.o.t  = 'tasks'
let g:which_key_map.f.o.w  = 'tasks'

function! OpenDailyNote()
  let l:path = strftime("~/org/notes/%b_%d_%Y.md")
  execute "edit " . l:path
endfunction

" tree
noremap <silent> <leader>tf :CocCommand explorer<CR>
let g:which_key_map.t   = { 'name': '+tree' }
let g:which_key_map.t.f = 'file tree'

" snippets
noremap <silent> <leader>ss :CocList snippets<CR>
noremap <silent> <leader>se :UltiSnipsEdit<CR>
let g:which_key_map.s   = { 'name': '+snippets' }
let g:which_key_map.s.s = 'snippets'
let g:which_key_map.s.e = 'edit snippets'

" buffer
noremap <silent> <leader>b  :Buffers<CR>
noremap <silent> <leader>Bb :Buffers<CR>
noremap <silent> <leader>Bd :bdel<CR>
let g:which_key_map.B   = { 'name': '+buffer' }
let g:which_key_map.B.b = 'find buffer'
let g:which_key_map.B.d = 'delete buffer'
let g:which_key_map.b   = 'find buffer'

" ripgrep
noremap <silent> <leader>rc :Commands<CR>
noremap <silent> <leader>rf :Filetypes<CR>
noremap <silent> <leader>rl :BLines<CR>
noremap <silent> <leader>rr :Rg<CR>
let g:which_key_map.r   = { 'name': '+ripgrep' }
let g:which_key_map.r.l = 'buffer lines'
let g:which_key_map.r.r = 'ripgrep'
let g:which_key_map.r.c = 'commands'
let g:which_key_map.r.f = 'file types'

" colorizer
nnoremap <silent> <leader>h :ColorizerToggle<CR>
let g:which_key_map.h = 'highlight colors'

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

" coc.vim function
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
inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" WhichKey
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey 'è'<CR>
