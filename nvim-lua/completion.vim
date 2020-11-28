Plug 'nvim-lua/completion-nvim'

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = "\<C-y>"
let g:completion_chain_complete_list = [
  \{'complete_items': ['lsp', 'snippet']},
  \{'mode': '<c-s>'},
  \{'mode': '<c-t>'}
\]

" Use completion-nvim in every buffer
au BufEnter * lua require'completion'.on_attach()
