" phaazon’s neovim configuration
set nocompatible

scriptencoding utf-8
set encoding=utf8

set wrap
set showmode!
set hlsearch
set backspace=indent,eol,start
set nobackup
set dir=/var/tmp
set history=500
set ruler
set showcmd
set incsearch
set noswapfile
set hidden
set laststatus=2
set autoread
set inccommand=nosplit
set wildignore+=*/target/*
set termguicolors
set fillchars=vert:│
set updatetime=300
set shortmess+=c
set foldmethod=manual
set timeoutlen=500
set updatetime=50
set smartindent
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2
set mouse=nvi
set conceallevel=3

" we want lines for all modes but terminal
set nu
au TermOpen * setlocal nonu

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

source ~/.config/nvim/plug.vim
source ~/.config/nvim/bepo.vim

lua require'colorizer'.setup()

let platform_specific_file="~/.config/nvim/platform-specific.vim"
if filereadable(platform_specific_file)
  source platform_specific_file
endif

" colorscheme
let g:color_scheme = 'dark'

" easy switch between dark and light colorschemes
function SwitchDarkLightColorscheme(...)
  if a:0
    if a:1 == 'dark'
      let g:color_scheme = 'light'
    elseif a:1 == 'light'
      let g:color_scheme = 'dark'
    endif
  endif

  let g:edge_transparent_background = 0

  if g:color_scheme == 'dark'
    let g:color_scheme = 'light'
    let g:lightline.colorscheme = 'edge'
    set background=light
    colorscheme edge
  else
    let g:color_scheme = 'dark'
    let g:lightline.colorscheme = 'edge'
    set background=dark
    colorscheme edge
  endif

  " sign/linenr column
  " hi Normal guibg=none
  " hi EndOfBuffer guibg=none
  " hi SignColumn guibg=none
  " hi GitGutterAdd guibg=none
  " hi GitGutterChange guibg=none
  " hi GitGutterChangeDelete guibg=none
  " hi GitGutterDelete guibg=none
  " hi link GitGutterAddLineNr GitGutterAdd
  " hi link GitGutterChangeLineNr GitGutterChange
  " hi link GitGutterDeleteLineNr GitGutterDelete
  " hi link GitGutterChangeDeleteLineNr GitGutterChangeDelete
endfunction

call SwitchDarkLightColorscheme("dark")

" markdown settings
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'haskell']
hi! link markdownItalic CyanItalic
hi! link markdownBold markdownH4

source ~/.config/nvim/key_bindings.vim
