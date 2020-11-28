Plug 'nvim-lua/completion-nvim'

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = "\<C-y>"

" Use completion-nvim in every buffer
au BufEnter * lua require'completion'.on_attach()
