Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ''
let g:fzf_action = {
  \ 'ctrl-T': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

noremap <silent> <leader>bb       :Buffers<CR>
noremap <silent> <leader>bd          :bdel<CR>
noremap <silent> <leader>bD         :bdel!<CR>
noremap <silent> <leader>bn           :new<CR>
nmap    <silent> <leader>bN        :tabnew<CR>
noremap <silent> <leader>bv          :vnew<CR>
nmap    <silent> <leader>bc          :tabp<CR>
nmap    <silent> <leader>br          :tabn<CR>
noremap <silent> <leader>bs             :w<CR>
noremap <silent> <leader>bS            :w!<CR>
noremap <silent> <leader><leader>  :GFiles<CR>
noremap <silent> <leader>ff         :Files<CR>
noremap <silent> <leader>fca                :e ~/.config/alacritty/alacritty.yml<CR>
noremap <silent> <leader>fcb                :e ~/.config/bspwm/bspwmrc<CR>
noremap <silent> <leader>fci                :e ~/.ssh/config<CR>
noremap <silent> <leader>fci                :e $MYVIMRC<CR>
noremap <silent> <leader>fck                :e ~/.config/nvim/key_bindings.vim<CR>
noremap <silent> <leader>fcp                :e ~/.config/nvim/plug.vim<CR>
noremap <silent> <leader>fcs                :e ~/.config/starship.toml<CR>
noremap <silent> <leader>fct                :e ~/.tmux.conf<CR>
noremap <silent> <leader>fcx                :e ~/.config/sxhkd/sxhkdrc<CR>
noremap <silent> <leader>fcz                :e ~/.zshrc<CR>
noremap <silent> <leader>fcZ                :e ~/.zprofile<CR>
noremap <silent> <leader>fh       :History<CR>
