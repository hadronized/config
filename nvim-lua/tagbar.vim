Plug 'preservim/tagbar'

let g:tagbar_map_togglesort = ''
let g:tagbar_compact = 2
let g:tagbar_show_data_type = 1
let g:tagbar_autopreview = 1

" function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
"     let colour = a:current ? '%#StatusLineBg#' : '%#StatusLineBg2c#'
"     let flagstr = join(flags, '')
"     if flagstr != ''
"         let flagstr = '[' . flagstr . '] '
"     endif
"     return colour . '[' . sort . '] ' . flagstr . fname
" endfunction
" let g:tagbar_status_func = 'TagbarStatusFunc'
