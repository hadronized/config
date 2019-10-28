let mapleader=","
let maplocalleader = "è"

noremap <C-c> :tabp<CR>
noremap <C-r> :tabn<CR>
noremap <C-n> :tabnew<CR>
noremap U :redo<CR>
noremap ,b :Buffers<CR>
noremap ,f :Files<CR>
"noremap ,t :Tags<CR>
noremap ,T :TagbarToggle<CR>
noremap ,qe :cc!<CR>
noremap ,qn :cn!<CR>
noremap ,qp :cp!<CR>
noremap ,qo :cope<CR>
noremap ,n :NERDTreeToggle<CR>
noremap ,gb :Gblame<CR>
noremap ,gl :ToggleBlameLine<CR>
noremap ,gc :Commits<CR>
noremap ,gd :GFiles?<CR>
noremap ,gf :GFiles<CR>
noremap ,gt :GitGutterNextHunk<CR>
noremap ,gs :GitGutterPrevHunk<CR>
"noremap k :ALEHover<CR>
"noremap gd :ALEGoToDefinition<CR>
nmap ,w <Plug>(easymotion-bd-w)
nmap ,W <Plug>(easymotion-overwin-w)
nmap ,c <Plug>(easymotion-bd-f)
nmap ,C <Plug>(easymotion-overwin-f)
nmap ,l <Plug>(easymotion-bd-jk)
nmap ,L <Plug>(easymotion-overwin-line)
nmap ,/ <Plug>(easymotion-sn)

" coc.vim
nmap <silent> ,d <Plug>(coc-definition)
nmap <silent> ,t <Plug>(coc-type-definition)
nmap <silent> ,i <Plug>(coc-implementation)
nmap <silent> ,r <Plug>(coc-references)
nmap <silent> ,s :CocList outline<CR>
nmap <silent> ,S :CocList symbols<CR>
nmap <silent> ,x :CocList diagnostics<CR>
inoremap <silent><expr> <c-tab> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
