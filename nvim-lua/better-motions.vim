" EasyMotion 💗
Plug 'easymotion/vim-easymotion'

let g:EasyMotion_keys = 'bpovdljzwxyqghfknarusite'
let g:EasyMotion_do_mapping = 0

nmap <silent> <leader>w <Plug>(easymotion-bd-w)
nmap <silent> <leader>W <Plug>(easymotion-overwin-w)
nmap <silent> <leader>é <Plug>(easymotion-bd-f)
nmap <silent> <leader>É <Plug>(easymotion-overwin-f)
nmap <silent> <leader>l <Plug>(easymotion-bd-jk)
nmap <silent> <leader>L <Plug>(easymotion-overwin-line)

" AeroJump, pretty useful too.
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

let g:aerojump_keymaps = {
  \ "<C-t>": "AerojumpDown",
  \ "<C-s>": "AerojumpUp",
  \ "<Esc>": "AerojumpExit",
  \ "<CR>": "AerojumpSelect",
  \ }

nmap <leader>ja :AnyJump<CR>
nmap <leader>jb <Plug>(AerojumpBolt)
nmap <leader>jc <Plug>(AerojumpFromCursorBolt)
nmap <leader>jj <Plug>(AerojumpDefault)
nmap <leader>jl :AnyJumpLastResults<CR>
nmap <leader>js <Plug>(AerojumpSpace)
