let mapleader=","
let maplocalleader = "è"

" misc
noremap U :redo<CR>

" tab key bindings
noremap <C-c> :tabp<CR>
noremap <C-r> :tabn<CR>
noremap <C-n> :tabnew<CR>

" file tree
noremap <leader>n :NERDTreeToggle<CR>

" fuzzy finders
noremap <leader>b :Buffers<CR>
noremap <leader>f :Files<CR>

" fuzzy git
noremap <leader>gb :Gblame<CR>
noremap <leader>gl :ToggleBlameLine<CR>
noremap <leader>gc :Commits<CR>
noremap <leader>gf :GFiles<CR>
noremap <leader>gd :GFiles?<CR>
noremap <leader>gt :GitGutterNextHunk<CR>
noremap <leader>gs :GitGutterPrevHunk<CR>

" error / warning reporting
noremap <leader>qe :cc!<CR>
noremap <leader>qn :cn!<CR>
noremap <leader>qp :cp!<CR>
noremap <leader>qo :cope<CR>

nmap <leader>w <Plug>(easymotion-bd-w)
nmap <leader>W <Plug>(easymotion-overwin-w)
nmap <leader>c <Plug>(easymotion-bd-f)
nmap <leader>C <Plug>(easymotion-overwin-f)
nmap <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)
nmap <leader>/ <Plug>(easymotion-sn)

" zoomin
noremap wz :ZoomWinTabToggle<CR>

" coc.vim
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>t <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>rr <Plug>(coc-references)
nmap <silent> <leader>sl :CocList symbols<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> <leader><space> <Plug>(coc-codelens-action)
nmap <silent> <leader>sr <Plug>(coc-rename)
nmap <silent> <leader>xl :CocList diagnostics<CR>
nmap <silent> <leader>xp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>xn <Plug>(coc-diagnostic-next)
nmap <leader>va <Plug>(coc-codeaction-selected>
xmap <leader>va <Plug>(coc-codeaction-selected>
nmap <leader>a <Plug>(coc-codeaction>
nmap <leader>qf <Plug>(coc-fix-current>

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
