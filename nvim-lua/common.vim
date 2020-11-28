" Enable numbers.
set nu

" Prevent buffers from getting lost when we close them.
set hidden

" Show the current line number highlighted for the cursor.
set cursorline

" Use 24-bit colors in the terminal.
set termguicolors

" Time to wait to update stuff (typically, the gutter columns / diagnostics).
set updatetime=10

" Insert spaces instead of tabs.
set expandtab

" Do not use swap files.

set noswapfile

" Number of spaces used for indentation.
set shiftwidth=2

" Number of spaces to show for tabs (when other people use them…).
set tabstop=2

" Mouse support.
set mouse=nvi

" Disable show mode, as we use the colorscheme to show it.
set showmode!

" Show the ruler.
set ruler

" Do not split and show matches when searching.
set inccommand=nosplit

" Various fill chars.
set fillchars=vert:│

" Time to wait for a keybinding sequence before timing out.
set timeoutlen=500

" Completion options (see :help completeopt)
set completeopt=menuone,noinsert,noselect

" Remove lines for terminal windows.
au TermOpen * setlocal nonu

" Remove trailing whitespaces.
au BufWritePre * %s/\s\+$//e

" Leader key.
let mapleader=' '
let maplocalleader = ','
