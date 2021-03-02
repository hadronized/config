Plug 'liuchengxu/vim-which-key'

let g:which_key_map = {  }

" Direct shortcuts.
let g:which_key_map[' '] = 'find file in project'

" File.
let g:which_key_map.f = { 'name': '+file' }
let g:which_key_map.f.f = 'find file in current dir'
let g:which_key_map.f.h = 'find file in history'
let g:which_key_map.f.c = { 'name': '+configuration' }
let g:which_key_map.f.c.c = 'common settings'
let g:which_key_map.f.c.i = 'init file'
let g:which_key_map.f.c.k = 'keybindings'
let g:which_key_map.f.c.l = 'LSP'
let g:which_key_map.f.c.p = 'packages'
let g:which_key_map.f.c.t = 'themes'
let g:which_key_map.f.t = 'open file tree'
let g:which_key_map.f.T = 'toggle filetype'

" Buffer and tabs.
let g:which_key_map.b = { 'name': '+buffer' }
let g:which_key_map.b.b = 'list buffers'
let g:which_key_map.b.d = 'delete buffer'
let g:which_key_map.b.D = 'delete buffer (force)'
let g:which_key_map.b.n = 'new horizontal buffer'
let g:which_key_map.b.v = 'new vertical buffer'
let g:which_key_map.b.c = 'go to left tab'
let g:which_key_map.b.r = 'go to right tab'
let g:which_key_map.b.s = 'save buffer'
let g:which_key_map.b.S = 'save buffer (force)'
let g:which_key_map.b.t = 'new tab buffer '

" Git.
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_map.g.b = 'blame'
let g:which_key_map.g.g = 'status'
let g:which_key_map.g.h = 'preview hunk'
let g:which_key_map.g.n = 'go to next hunk'
let g:which_key_map.g.p = 'go to previous hunk'
let g:which_key_map.g.s = 'stage hunk'
let g:which_key_map.g.S = 'stage file'
let g:which_key_map.g.x = 'revert hunk'
let g:which_key_map.g.z = 'fold hunks'

" Context.
let g:which_key_map.C = { 'name': '+context' }
let g:which_key_map.C.p = 'peek context'
let g:which_key_map.C.t = 'toggle context'

" Search.
let g:which_key_map.s = { 'name': '+search' }
let g:which_key_map.s.b = 'search in buffer'
let g:which_key_map.s.s = 'search everywhere'

" Code.
let g:which_key_map.c = { 'name': '+code' }
let g:which_key_map.c.a = 'code action'
let g:which_key_map.c.b = 'search symbol in buffer'
let g:which_key_map.c.d = 'jump to declaration'
let g:which_key_map.c.D = 'jump to references'
let g:which_key_map.c.h = 'signature help'
let g:which_key_map.c.l = { 'name': '+LSP' }
let g:which_key_map.c.l.r = 'restart current clients'
let g:which_key_map.c.n = 'go to next diagnostic'
let g:which_key_map.c.o = 'outline'
let g:which_key_map.c.p = 'go to previous diagnostic'
let g:which_key_map.c.q = 'open quickfix'
let g:which_key_map.c.r = 'rename'
let g:which_key_map.c.s = 'search symbol in project'
let g:which_key_map.c.S = 'search symbol in document'
let g:which_key_map.c.t = 'jump to type definition'
let g:which_key_map.c.T = 'search tags'
let g:which_key_map.c.x = 'open diagnostics'

" Hop.
let g:which_key_map['/'] = 'hop patterns'

" Notes.
let g:which_key_map.n = { 'name': '+notes' }
let g:which_key_map.n.j = 'open journal'

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_sep = '→'
let g:which_key_use_floating_win = 1
let g:which_key_display_names = {' ': '␣', '<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_disable_default_offset = 1

highlight default link WhichKey          Include
highlight default link WhichKeySeperator Comment
highlight default link WhichKeyGroup     Keyword
highlight default link WhichKeyDesc      String
highlight default link WhichKeyFloating  CursorColumn
