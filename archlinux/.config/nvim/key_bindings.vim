let mapleader=","
let maplocalleader = "è"

noremap <C-c> :tabp<CR>
noremap <C-r> :tabn<CR>
noremap <C-n> :tabnew<CR>
noremap U :redo<CR>
noremap ,b :Buffers<CR>
noremap ,f :Files<CR>
"noremap ,r :ALEFindReferences<CR>
noremap ,t :Tags<CR>
noremap ,T :TagbarToggle<CR>
noremap ,qe :cc!<CR>
noremap ,qn :cn!<CR>
noremap ,qp :cp!<CR>
noremap ,qo :cope<CR>
noremap ,n :NERDTreeToggle<CR>
noremap ,gb :Gblame<CR>
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

nnoremap ,d :Find<space><C-r><C-w><cr>
command! -bang -nargs=* Find call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always" '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0
\ )
