let g:lightline.colorscheme = 'sonokai'
colorscheme sonokai

" Some nice touch, because I like looking FABULOUS
hi! CursorLineNr cterm=bold guifg=#bb97ee guibg=#333645
hi! CursorLine guibg=#333645
hi! link LineNr NonText

" override git gutter highlight to respect diff
hi! link GitGutterAdd GreenSign
hi! link GitGutterDelete RedSign
hi! link GitGutterChange PurpleSign
hi! link GitGutterChangeDelete RedSign
