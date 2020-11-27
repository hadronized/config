call plug#begin('plugged')

source themes.vim

source auto-pairs.vim
source buffers-and-files.vim
source better-motions.vim
source commentary.vim
source colorizer.vim
source context.vim
source devicons.vim
source echodoc.vim
source easy-align.vim
source git.vim
source markdown.vim
source snippets.vim
source surround.vim
source treesitter.vim

call plug#end()

" Run some lua code
lua require('treesitter')
