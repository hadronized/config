Plug 'nvim-lua/completion-nvim'

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_paren = 1
let g:completion_chain_complete_list = [
  \{'complete_items': ['lsp']},
  \{'complete_items': ['snippet']},
  \{'complete_items': ['path']},
  \{'mode': '<c-s>'},
  \{'mode': '<c-t>'}
\]
let g:completion_trigger_character = ['.', '::']
let g:completion_trigger_on_delete = 1
let g:completion_auto_change_source = 1
let g:completion_matching_strategy_list = ['exact', 'fuzzy']

" Use completion-nvim in every buffer
au BufEnter * lua require'completion'.on_attach()

" Smart completion.
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
