" Gimme line numbers.
set nu
" Wrap lines at the end of buffer’s framebuffer.
set wrap
" Disable show mode, as we use the colorscheme to show it.
set showmode!
" Enables search highlights.
set hlsearch
" Do not backup editing files.
set nobackup
" Show the ruler.
set ruler
" Show the color column
set colorcolumn=120
" Useful for ^w.
set backspace=indent,eol,start
" Show partial command.
set showcmd
" Show incremental search.
set incsearch
" Do not swap files.
set noswapfile
" I don’t remember what this does but I think it’s important.
set hidden
" 2 means always. Always what? I don’t know.
set laststatus=2
" Automatically read modified files.
set autoread
" Do not split and show matches when searching.
set inccommand=nosplit
" Ignore gone wild.
set wildignore+=*/target/*
" Use 24-bit colors in the terminal.
set termguicolors
" Various fill chars.
set fillchars=vert:│
" Mute some messages in the statusline.
set shortmess+=c
" Method of folding.
set foldmethod=syntax
set foldlevelstart=99
" Mapped sequence timeout.
set timeoutlen=500
" Time between neovim waits before updating sign / gutters. It’s a stupid
" option, it should be instead.
set updatetime=10
" Smart indenting for new lines.
set smartindent
set autoindent
" Insert spaces instead of tabs.
set expandtab
" Number of spaces used for indentation.
set shiftwidth=2
" Number of spaces to show for tabs (when other people use them…).
set tabstop=2
" Mous support.
set mouse=nvi
" Nice cursor line.
set cursorline
" " Pseudo-transparency.
" set winblend=60
" set pumblend=60

" Remove lines for terminal windows.
au TermOpen * setlocal nonu
" Remove trailing whitespaces.
au BufWritePre * %s/\s\+$//e
" Highlight yank.
au TextYankPost * silent! lua vim.highlight.on_yank()
