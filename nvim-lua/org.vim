Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'

let g:org_indent = 1
let g:org_todo_keywords = ['TODO', 'WIP', 'IDEA', 'WAIT', '|', 'DONE', 'KILL']
let g:org_agenda_files=['~/org/todo.org']

hi! default org_todo_keyword_TODO guifg=#46D9FF gui=bold
hi! default org_todo_keyword_WIP  guifg=#98BE65 gui=bold
hi! default org_todo_keyword_IDEA guifg=#C678DD gui=bold
hi! default org_todo_keyword_WAIT guifg=#ECBE7B gui=bold
hi! default org_todo_keyword_DONE guifg=#5B6268 gui=bold
hi! default org_todo_keyword_KILL guifg=#FF6C6B gui=bold

hi! default orgtodo_todo_keyword_TODO guifg=#46D9FF gui=bold
hi! default orgtodo_todo_keyword_WIP  guifg=#98BE65 gui=bold
hi! default orgtodo_todo_keyword_IDEA guifg=#C678DD gui=bold
hi! default orgtodo_todo_keyword_WAIT guifg=#ECBE7B gui=bold
hi! default orgtodo_todo_keyword_DONE guifg=#5B6268 gui=bold
hi! default orgtodo_todo_keyword_KILL guifg=#FF6C6B gui=bold
